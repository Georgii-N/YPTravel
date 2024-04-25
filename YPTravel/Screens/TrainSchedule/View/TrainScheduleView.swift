import SwiftUI

struct TrainScheduleView: View {
    
    @StateObject private var viewModel = TrainScheduleViewModel()
    
    @Binding var path: [String]
    
    var body: some View {
        ZStack {
            VStack() {
                Text("Москва (Ярославский вокзал) → Санкт Петербург (Балтийский вокзал) ")
                    .foregroundStyle(.ypBlackUniversal)
                    .font(.boldMedium)
                
                LazyVStack(spacing: UIConstants.smallPadding) {
                    ForEach(viewModel.routes, id: \.id) { route in
                        TrainScheduleRow(route: route)
                    }
                }
            }
            .padding()
            
            VStack {
                Spacer()
                Button("Уточнить время") {
                    
                }
                .frame(maxWidth: .infinity)
                .frame(height: UIConstants.searchButtonHeight)
                .font(.boldSmall)
                .background(.ypBlue)
                .foregroundColor(.ypWhite)
                .cornerRadius(UIConstants.cornerRadiusSmall)
                .padding(.horizontal)
                .padding(.bottom, UIConstants.paddingLarge)
            }
        }
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

#Preview {
    TrainScheduleView(path: .constant([]))
}
