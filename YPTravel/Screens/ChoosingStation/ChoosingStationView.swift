import SwiftUI

struct ChoosingStationView: View {
    @StateObject private var viewModel = ChoosingStationViewModel()
    
    @Binding var path: [String]
    @Binding var selectedStation: String?
    
    var body: some View {
        GeometryReader { _ in
            VStack {
                CustomSearchBar(text: $viewModel.searchText)
                    .padding(.horizontal)
                if viewModel.filteredStations.isEmpty {
                    VStack {
                        Spacer()
                        Text("Станции не найдены")
                            .foregroundColor(.ypBlack)
                            .font(.boldMedium)
                        Spacer()
                    }
                } else {
                LazyVStack(spacing: .zero) {
                    ForEach(viewModel.filteredStations, id: \.self) { station in
                        CustomListRow(text: station)
                            .padding(.horizontal)
                            .onTapGesture {
                                selectedStation = (selectedStation ?? "") + " (\(station))"
                                path.removeLast(path.count)
                            }
                    }
                    }
                }
                Spacer()
            }
            .navigationTitle("Выбор станции")
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
    ChoosingStationView(path: .constant([]), selectedStation: .constant("Москва"))
}
