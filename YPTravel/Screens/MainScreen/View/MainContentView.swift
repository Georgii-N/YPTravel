import SwiftUI

struct MainContentView: View {
    
    @State private var path: [String] = []
    @State private var toCity: String? = nil
    @State private var fromCity: String? = nil
    @State private var isShowingSearchButton = false
    
    var body: some View {
        NavigationStack(path: $path) {
            TabView {
                VStack {
                    HStack(spacing: .zero) {
                        VStack(spacing: .zero) {
                            Text(fromCity ?? "Откуда")
                                .padding()
                                .foregroundColor(fromCity == nil ? .ypGray : .ypBlack)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(.ypWhite)
                                .font(.regularMedium)
                                .onTapGesture {
                                    path.append("ChoosingCityViewFrom")
                                }
                            
                            Text(toCity ?? "Куда")
                                .padding()
                                .foregroundColor(toCity == nil ? .ypGray : .ypBlack)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(.ypWhite)
                                .font(.regularMedium)
                                .onTapGesture {
                                    path.append("ChoosingCityViewTo")
                                }
                               
                        }
                        .cornerRadius(UIConstants.cornerRadiusMedium)
                        .padding()
                        
                        Button(action: {
                            swap(&fromCity, &toCity)
                        }) {
                            Image(.textFieldChange)
                        }
                        .frame(width: UIConstants.swapButtonSide, height: UIConstants.swapButtonSide)
                        .background(.ypWhite)
                        .cornerRadius(UIConstants.cornerRadiusLarge)
                        .padding(.trailing, UIConstants.padding)
                    }
                    .background(.ypBlue)
                    .cornerRadius(UIConstants.cornerRadiusMedium)
                    .padding(.horizontal)
                    
                   
                    if toCity != nil && fromCity != nil {
                        Button("Найти") {
                            
                        }
                        .frame(width: UIConstants.searchButtonWidth, height: UIConstants.searchButtonHeight)
                        .font(.boldSmall)
                        .background(.ypBlue)
                        .foregroundColor(.ypWhite)
                        .cornerRadius(UIConstants.cornerRadiusSmall)
                        .padding()
                    }
                }
                .tabItem {
                    Label("", image: "tabSchedule")
                }
                
                ZStack {
                    Text("2")
                }
                .tabItem {
                    Label("", image: "tabSettings")
                }
            }
            .navigationDestination(for: String.self) { id in
                if id == "ChoosingCityViewFrom" {
                    ChoosingCityView(path: $path, selectedCity: $fromCity)
                } else if id == "ChoosingCityViewTo" {
                    ChoosingCityView(path: $path, selectedCity: $toCity)
                }
            }
            .tint(.black)
        }
    }
}


#Preview {
    MainContentView()
}
