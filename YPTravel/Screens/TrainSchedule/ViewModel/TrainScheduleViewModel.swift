import Foundation

class TrainScheduleViewModel: ObservableObject {
    
    @Published var routes: [RouteModel] = [
        RouteModel(company: "ФГК", date: "14 января", transferDetails: "С пересадкой в Костроме", departureTime: "22:30", tripDuration: "20 часов", arrivalTime: "08:15"),
        RouteModel(company: "РЖД", date: "22 февраля", transferDetails: nil, departureTime: "06:00", tripDuration: "3 часа", arrivalTime: "09:00"),
        RouteModel(company: "ЛокоТранс", date: "5 марта", transferDetails: "Пересадка в Ярославле", departureTime: "15:45", tripDuration: "18 часов", arrivalTime: "09:45"),
        RouteModel(company: "Сибирские ЖД", date: "15 апреля", transferDetails: "Пересадка в Новосибирске", departureTime: "12:30", tripDuration: "24 часа", arrivalTime: "00:30"),
        RouteModel(company: "Уральские ЖД", date: "28 мая", transferDetails: "С двумя пересадками", departureTime: "08:20", tripDuration: "12 часов", arrivalTime: "20:20"),
        RouteModel(company: "Московские ЖД", date: "10 июня", transferDetails: nil, departureTime: "23:15", tripDuration: "7 часов", arrivalTime: "06:15")
    ]
    
    @Published var filteredRoutes: [RouteModel] = []
    
    init() {
        filteredRoutes = routes
    }
    
    func applyFilters(_ filterOptions: FilterSettings) {
        filteredRoutes = routes.filter { route in
            guard let departureHour = Int(route.departureTime.prefix(2)) else { return false }
            
            let matchesTime = (!filterOptions.morningSelected && !filterOptions.afternoonSelected && !filterOptions.eveningSelected && !filterOptions.nightSelected) ||
            (filterOptions.morningSelected && (6...11).contains(departureHour)) ||
            (filterOptions.afternoonSelected && (12...17).contains(departureHour)) ||
            (filterOptions.eveningSelected && (18...23).contains(departureHour)) ||
            (filterOptions.nightSelected && ((0...5).contains(departureHour) || departureHour == 24))
            
            let matchesTransfer: Bool
            let transferDetails = route.transferDetails
            
            if let showTransfers = filterOptions.showTransfers {
                if transferDetails != nil && showTransfers == "Да" {
                    matchesTransfer = true
                } else if transferDetails == nil && showTransfers == "Нет" {
                    matchesTransfer = true
                } else {
                    matchesTransfer = false
                }
            } else {
                matchesTransfer = true
            }
            
            return matchesTime && matchesTransfer
        }
    }
}
