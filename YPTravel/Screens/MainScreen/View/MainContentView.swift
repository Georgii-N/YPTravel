import SwiftUI

struct MainContentView: View {
    
    private let networkClient: NetworkClientProtocol = NetworkClient()
    var body: some View {
        Text("Я")
    }
    
    private func getTripsSchedule() {
        Task {
            let schedule = try await networkClient.getTripsSchedule("c146", "c213")
            print(schedule)
        }
    }
    
    private func tripsByStation() {
        Task {
            let tripsByStation = try await networkClient.getTripsByStation(station: "s2000003")
            print(tripsByStation)
        }
    }
    
    private func getListOfStations() {
        Task {
            let tripsByStation = try await networkClient.getListOfStations(uid: "126YE_10_2")
            print(tripsByStation)
        }
    }
    
    func getNearestStations() {
        Task {
            let nearestStations = try await networkClient.getNearestStations(lat: 59.864177, lng: 30.319163, distance: 50)
            print(nearestStations)
        }
    }
    
    private func getNearestSettlement() {
        Task {
            let nearestSettlement = try await networkClient.getNearestSettlement(lat: 59.864177, lng: 30.319163, distance: 50)
            print(nearestSettlement)
        }
    }
    
    private func getCarrierInformation() {
        Task {
            let carrierInformation = try await networkClient.getCarrierInformation(code: "TK", system: "iata")
            print(carrierInformation)
        }
    }
    
    private func getAllStationsList() {
        Task {
            do {
                let response = try await networkClient.getAllStationsList()
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
    
    private func getCopyright() {
        Task {
            let copyright = try await networkClient.getCopyright()
            print(copyright)
        }
    }
}

#Preview {
    MainContentView()
}
