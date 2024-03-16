import OpenAPIRuntime
import OpenAPIURLSession

typealias NearestStations = Components.Schemas.Stations
typealias TripsSchedule = Components.Schemas.TripsSchedule
typealias TripsByStation = Components.Schemas.TripsByStation
typealias ListOfStations = Components.Schemas.ListOfStations
typealias NearestSettlement = Components.Schemas.NearestSettlement
typealias CarrierInformation = Components.Schemas.Carriers
typealias AllStationsList = Components.Schemas.AllStationsList
typealias Сopyright = Components.Schemas.Copyrights

final class NetworkClient: NetworkClientProtocol {
    
    private let client = Client(
        serverURL: try! Servers.server1(),
        transport: URLSessionTransport()
    )
    
    private let apiKey = Resources.apiKey.defaultApiKey
    
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations {
        do {
            let response = try await client.getNearestStations(query: .init(
                apikey: apiKey,
                lat: lat,
                lng: lng,
                distance: distance
            ))
            return try response.ok.body.json
        } catch {
            print("Error in getNearestStations: \(error)")
            throw error
        }
    }
    
    func getTripsSchedule(_ from: String, _ to: String) async throws -> TripsSchedule {
        do {
            let response = try await client.getTripsSchedule(
                query: .init(
                    apikey: apiKey,
                    from: from,
                    to: to
                )
            )
            return try response.ok.body.json
        } catch {
            print("Error in getTripsSchedule: \(error)")
            throw error
        }
    }
    
    func getTripsByStation(station: String) async throws -> TripsByStation {
        do {
            let response = try await client.getTripsByStation(
                query: .init(
                    apikey: apiKey, station: station
                )
            )
            return try response.ok.body.json
        } catch {
            print("Error in getTripsByStation: \(error)")
            throw error
        }
    }
    
    func getListOfStations(uid: String) async throws -> ListOfStations {
        do {
            let response = try await client.getListOfStations(
                query: .init(
                    apikey: apiKey, uid: uid
                )
            )
            return try response.ok.body.json
        } catch {
            print("Error in getListOfStations: \(error)")
            throw error
        }
    }
    
    func getNearestSettlement(lat: Double, lng: Double, distance: Int) async throws -> NearestSettlement {
        do {
            let response = try await client.getNearestSettlement(
                query: .init(apikey: apiKey, lat: lat, lng: lng, distance: distance
                )
            )
            return try response.ok.body.json
        } catch {
            print("Error in getNearestSettlement: \(error)")
            throw error
        }
    }
    
    func getCarrierInformation(code: String, system: String) async throws -> CarrierInformation {
        do {
            let response = try await client.getCarrierInformation(
                query: .init(apikey: apiKey, code: code, system: system
                )
            )
            return try response.ok.body.json
        } catch {
            print("Error in getCarrierInformation: \(error)")
            throw error
        }
    }
    
    func getAllStationsList() async throws -> HTTPBody {
        do {
            let response = try await client.getAllStationsList(
                query: .init(apikey: apiKey
                )
            )
            return try response.ok.body.html
        } catch {
            print("Error in getAllStationsList: \(error)")
            throw error
        }
    }
    
    func getCopyright() async throws -> Сopyright {
        do {
            let response = try await client.getCopyright(
                query: .init(apikey: apiKey
                )
            )
            return try response.ok.body.json
        } catch {
            print("Error in getCopyright: \(error)")
            throw error
        }
    }
}
