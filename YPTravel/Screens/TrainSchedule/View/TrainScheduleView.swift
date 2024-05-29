import SwiftUI

struct TrainScheduleView: View {
    
    @StateObject private var viewModel = TrainScheduleViewModel()
    
    @Binding var path: [String]
    @Binding var filterOptions: FilterSettings
    @Binding var carrier: String?
    
    var body: some View {
        ZStack {
            VStack() {
                Text("Москва (Ярославский вокзал) → Санкт Петербург (Балтийский вокзал) ")
                    .foregroundStyle(.ypBlack)
                    .font(.boldMedium)
                
                ScrollView {
                    LazyVStack(spacing: UIConstants.smallPadding) {
                        
                        ForEach(viewModel.filteredRoutes, id: \.id) { route in
                            TrainScheduleRow(route: route)
                                .onTapGesture {
                                    path.append("CarrierView")
                                }
                        }
                    }
                }
                Spacer()
            }
            .padding()
            
            VStack {
                Spacer()
                Button("Уточнить время") {
                    
                    if path.contains("FilterScheduleView") {
                        path.removeLast()
                    } else {
                        path.append("FilterScheduleView")
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .frame(height: UIConstants.searchButtonHeight)
                .font(.boldSmall)
                .background(.ypBlue)
                .foregroundColor(.ypWhiteUniversal)
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
                        .foregroundColor(.ypBlack)
                }
            }
        }
        .tint(.black)
        .onAppear {
            viewModel.applyFilters(filterOptions)
        }
    }
}

#Preview {
    TrainScheduleView(path: .constant([]), filterOptions: .constant(FilterSettings(morningSelected: false, afternoonSelected: false, eveningSelected: false, nightSelected: false, showTransfers: nil)), carrier: .constant(nil))
}
