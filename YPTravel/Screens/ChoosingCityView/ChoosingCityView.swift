
import SwiftUI

struct ChoosingCityView: View {
    @StateObject private var viewModel = ChoosingCityViewModel()
    
    @Binding var path: [String]
    @Binding var selectedCity: String?
    
    var body: some View {
        
        GeometryReader { _ in 
            VStack {
                CustomSearchBar(text: $viewModel.searchText)
                    .padding(.horizontal)
                LazyVStack {
                    ForEach(viewModel.filteredCities, id: \.self) { city in
                        CustomListRow(text: city)
                            .padding(.horizontal)
                            .onTapGesture {
                                selectedCity = city
                                path.removeLast()
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
    ChoosingCityView(path: .constant([]), selectedCity: .constant(nil))
}
