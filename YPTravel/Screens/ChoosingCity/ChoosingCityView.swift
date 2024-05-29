import SwiftUI

struct ChoosingCityView: View {
    @StateObject private var viewModel = ChoosingCityViewModel()
    
    @Binding var path: [String]
    @Binding var selectedCity: String?
    
    var direction: Direction
    
    var body: some View {
        GeometryReader { _ in
            VStack {
                CustomSearchBar(text: $viewModel.searchText)
                    .padding(.horizontal)
                if viewModel.filteredCities.isEmpty {
                    VStack {
                        Spacer()
                        Text("Город не найден")
                            .foregroundColor(.ypBlack)
                            .font(.boldMedium)
                        Spacer()
                    }
                } else {
                    LazyVStack(spacing: .zero) {
                        ForEach(viewModel.filteredCities, id: \.self) { city in
                            CustomListRow(text: city)
                                .padding(.horizontal)
                                .onTapGesture {
                                    selectedCity = city
                                    let destination = direction == .to ? "ChoosingStationViewTo" : "ChoosingStationViewFrom"
                                    path.append(destination)
                                }
                        }
                    }
                }
                Spacer()
            }
            
            .navigationTitle("Выбор города")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        path.removeLast()
                    }) {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.black)
                    }
                }
            }
            .tint(.black)
        }
    }
}

#Preview {
    ChoosingCityView(path: .constant([]), selectedCity: .constant(nil), direction: .to)
}
