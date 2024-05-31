import Foundation

struct RouteModel: Identifiable {
    var id = UUID()
    var company: String
    var date: String
    var transferDetails: String?
    var departureTime: String
    var tripDuration: String
    var arrivalTime: String
}
