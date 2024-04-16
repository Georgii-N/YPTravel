
import SwiftUI

struct ChoosingCityView: View {
    @Binding var path: [String]
    @StateObject var viewModel = ChoosingCityViewModel()

    var body: some View {
        List(viewModel.cities, id: \.self) { city in
            Text(city)
                .onTapGesture {
                    path.append(city)
                }
        }
    }
}


#Preview {
    ChoosingCityView(path: .constant([]))
}
