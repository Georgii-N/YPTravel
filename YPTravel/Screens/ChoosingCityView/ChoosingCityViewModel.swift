import Foundation

class ChoosingCityViewModel: ObservableObject {
    @Published var cities: [String] = ["Москва", "Санкт-Петербург", "Сочи", "Горный воздух", "Краснодар", "Казань", "Омск"]
}
