// 1. Импортируем библиотеки
import OpenAPIRuntime
import OpenAPIURLSession

// 2. Улучшаем читаемость кода — необязательный шаг
typealias NearestStations = Components.Schemas.Stations

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
