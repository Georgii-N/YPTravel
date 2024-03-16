// 1. Импортируем библиотеки
import OpenAPIRuntime
import OpenAPIURLSession
import SwiftUI

// 2. Улучшаем читаемость кода — необязательный шаг
typealias NearestStations = Components.Schemas.Stations
typealias TripsSchedule = Components.Schemas.TripsSchedule
typealias TripsByStation = Components.Schemas.TripsByStation
typealias ListOfStations = Components.Schemas.ListOfStations
typealias NearestSettlement = Components.Schemas.NearestSettlement
typealias CarrierInformation = Components.Schemas.Carriers
typealias AllStationsList = Components.Schemas.AllStationsList
typealias Сopyright = Components.Schemas.Copyrights

protocol NearestStationsServiceProtocol {
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations
}

final class NearestStationsService: NearestStationsServiceProtocol {
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations {
        // В документе с описанием запроса мы задали параметры apikey, lat, lng и distance
        // Для вызова сгенерированной функции нужно передать эти параметры
        let response = try await client.getNearestStations(query: .init(
            apikey: apikey,
            lat: lat,
            lng: lng,
            distance: distance
        ))
        return try response.ok.body.json
    }
    
    func getTripsSchedule(_ from: String, _ to: String) async throws -> TripsSchedule {
        let response = try await client.getTripsSchedule(
            query: .init(
                apikey: apikey,
                from: from,
                to: to
            )
        )
        
        return try response.ok.body.json
    }
    
    func getTripsByStation(station: String) async throws -> TripsByStation {
        let response = try await client.getTripsByStation(
            query: .init(
                apikey: apikey, station: station
            )
        )
        
        return try response.ok.body.json
    }
    
    func getListOfStations(uid: String) async throws -> ListOfStations {
        let response = try await client.getListOfStations(
            query: .init(
                apikey: apikey, uid: uid
            )
        )
        
        return try response.ok.body.json
    }
    
    func getNearestSettlement() async throws -> NearestSettlement {
        let response = try await client.getNearestSettlement(
            query: .init(apikey: apikey, lat: 59.864177, lng: 30.319163, distance: 50
            )
        )
        
        return try response.ok.body.json
    }
    
    func getCarrierInformation() async throws -> CarrierInformation {
        let response = try await client.getCarrierInformation(
            query: .init(apikey: apikey, code: "TK", system: "iata"
            )
        )
        
        return try response.ok.body.json
    }
    
    func getAllStationsList() async throws -> HTTPBody {
        let response = try await client.getAllStationsList(
            query: .init(apikey: apikey
            )
        )
        
        return try response.ok.body.html
    }
    
    func getCopyright() async throws -> Сopyright {
        let response = try await client.getCopyright(
            query: .init(apikey: apikey
            )
        )
        
        return try response.ok.body.json
    }
}

func stations() {
    let client = Client(
        serverURL: try! Servers.server1(),
        transport: URLSessionTransport()
    )
    
    let service = NearestStationsService(
        client: client,
        apikey: "d52e2ffc-ec87-4d27-8247-5c7f412d514e"
    )
    
    Task {
        let stations = try await service.getNearestStations(lat: 59.864177, lng: 30.319163, distance: 50)
        print(stations)
    }
}

func schedule() {
    let client = Client(
        serverURL: try! Servers.server1(),
        transport: URLSessionTransport()
    )
    
    let service = NearestStationsService(
        client: client,
        apikey: "d52e2ffc-ec87-4d27-8247-5c7f412d514e"
    )
    
    Task {
        let schedule = try await service.getTripsSchedule("c146", "c213")

        print(schedule)
    }
}

func tripsByStation() {
    let client = Client(
        serverURL: try! Servers.server1(),
        transport: URLSessionTransport()
    )
    
    let service = NearestStationsService(
        client: client,
        apikey: "d52e2ffc-ec87-4d27-8247-5c7f412d514e"
    )
    
    Task {
        let tripsByStation = try await service.getTripsByStation(station: "s2000003")
        print(tripsByStation)
    }
}

func getListOfStations() {
    let client = Client(
        serverURL: try! Servers.server1(),
        transport: URLSessionTransport()
    )
    
    let service = NearestStationsService(
        client: client,
        apikey: "d52e2ffc-ec87-4d27-8247-5c7f412d514e"
    )
    
    Task {
        let tripsByStation = try await service.getListOfStations(uid: "126YE_10_2")
        print(tripsByStation)
    }
}

func getNearestSettlement() {
    let client = Client(
        serverURL: try! Servers.server1(),
        transport: URLSessionTransport()
    )
    
    let service = NearestStationsService(
        client: client,
        apikey: "d52e2ffc-ec87-4d27-8247-5c7f412d514e"
    )
    
    Task {
        let nearestSettlement = try await service.getNearestSettlement()
        print(nearestSettlement)
    }
}

func getCarrierInformation() {
    let client = Client(
        serverURL: try! Servers.server1(),
        transport: URLSessionTransport()
    )
    
    let service = NearestStationsService(
        client: client,
        apikey: "d52e2ffc-ec87-4d27-8247-5c7f412d514e"
    )
    
    Task {
        let carrierInformation = try await service.getCarrierInformation()
        print(carrierInformation)
    }
}

func getAllStationsList() {
    let client = Client(
        serverURL: try! Servers.server1(),
        transport: URLSessionTransport()
    )
    
    let service = NearestStationsService(
        client: client,
        apikey: "d52e2ffc-ec87-4d27-8247-5c7f412d514e"
    )
    
    Task {
        do {
            let response = try await service.getAllStationsList()
            let data = try await Data(collecting: response,
                                      upTo: 50 * 1024 * 1024)

            let allStationsList = try JSONDecoder().decode(AllStationsList.self,
                                                     from: data)
            print(allStationsList.countries?.count)
        } catch {
            print("Error fetching all stations list: \(error)")
        }
    }
}

func getCopyright() {
    let client = Client(
        serverURL: try! Servers.server1(),
        transport: URLSessionTransport()
    )
    
    let service = NearestStationsService(
        client: client,
        apikey: "d52e2ffc-ec87-4d27-8247-5c7f412d514e"
    )
    
    Task {
        let copyright = try await service.getCopyright()
        print(copyright)
    }
}
