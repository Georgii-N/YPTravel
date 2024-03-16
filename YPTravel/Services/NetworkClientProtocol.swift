import Foundation
import OpenAPIRuntime

protocol NetworkClientProtocol {
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations
    func getTripsSchedule(_ from: String, _ to: String) async throws -> TripsSchedule
    func getTripsByStation(station: String) async throws -> TripsByStation
    func getListOfStations(uid: String) async throws -> ListOfStations
    func getNearestSettlement(lat: Double, lng: Double, distance: Int) async throws -> NearestSettlement
    func getCarrierInformation(code: String, system: String) async throws -> CarrierInformation
    func getAllStationsList() async throws -> HTTPBody
    func getCopyright() async throws -> Сopyright
}
