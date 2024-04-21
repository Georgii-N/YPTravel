import Foundation

class ChoosingStationViewModel: ObservableObject {
    @Published var searchText = ""
    private var stations: [String] = ["Курский вокзал", "Ленинградский вокзал", "Казанский вокзал", "Минский вокзал", "Павелецкий вокзал"]
    
    var filteredStations: [String] {
        if searchText.isEmpty {
            return stations
        } else {
            return stations.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
}
