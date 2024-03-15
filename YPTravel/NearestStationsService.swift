// 1. Импортируем библиотеки
import OpenAPIRuntime
import OpenAPIURLSession

// 2. Улучшаем читаемость кода — необязательный шаг
typealias NearestStations = Components.Schemas.Stations
typealias TripsSchedule = Components.Schemas.TripsSchedule
typealias TripsByStation = Components.Schemas.TripsByStation

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
        print("getTripsByStation")
        let response = try await client.getTripsByStation(
            query: .init(
                apikey: apikey, station: station
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

        print(tripsByStation)
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
        let tripsByStation = try await service.getTripsByStation(station: "s9616628")
        print(tripsByStation)
    }
}


