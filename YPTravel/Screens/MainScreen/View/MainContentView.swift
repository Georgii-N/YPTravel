import SwiftUI

struct MainContentView: View {
    
    @Binding var isDarkMode: Bool

    @State private var path: [String] = []
    @State private var filterOptions = FilterSettings(morningSelected: false,
                                                      afternoonSelected: false,
                                                      eveningSelected: false,
                                                      nightSelected: false,
                                                      showTransfers: nil)
    
    @State private var toCity: String? = nil
    @State private var fromCity: String? = nil
    @State private var isShowingSearchButton = false
    
    @State private var carrier: String? = nil
    
    var body: some View {
        NavigationStack(path: $path) {
            TabView {
                ZStack {
                    Color.ypWhite
                        .ignoresSafeArea(.all)
                    
                    VStack {
                        HStack(spacing: .zero) {
                            VStack(spacing: .zero) {
                                Text(fromCity ?? "Откуда")
                                    .padding()
                                    .foregroundColor(fromCity == nil ? .ypGray : .ypBlackUniversal)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(.ypWhiteUniversal)
                                    .font(.regularMedium)
                                    .onTapGesture {
                                        path.append("ChoosingCityViewFrom")
                                    }
                                
                                Text(toCity ?? "Куда")
                                    .padding()
                                    .foregroundColor(toCity == nil ? .ypGray : .ypBlackUniversal)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(.ypWhiteUniversal)
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
                            .background(.ypWhiteUniversal)
                            .cornerRadius(UIConstants.cornerRadiusLarge)
                            .padding(.trailing, UIConstants.padding)
                        }
                        .background(.ypBlue)
                        .cornerRadius(UIConstants.cornerRadiusMedium)
                        .padding(.horizontal)
                        
                       
                        if toCity != nil && fromCity != nil {
                            Button("Найти") {
                                path.append("TrainScheduleView")
                            }
                            .frame(width: UIConstants.searchButtonWidth, height: UIConstants.searchButtonHeight)
                            .font(.boldSmall)
                            .background(.ypBlue)
                            .foregroundColor(.ypWhiteUniversal)
                            .cornerRadius(UIConstants.cornerRadiusSmall)
                            .padding()
                        }
                    }
                }
                .tabItem {
                    Label("", image: "tabSchedule")
                }
                
                ZStack {
                    Color.ypWhite
                        .ignoresSafeArea(.all)
                    SettingsView(isDarkMode: $isDarkMode, path: $path)
                }
                .tabItem {
                    Label("", image: "tabSettings")
                }
            }
            .navigationDestination(for: String.self) { id in
                if id == "ChoosingCityViewFrom" {
                    ChoosingCityView(path: $path, selectedCity: $fromCity, direction: .from)
                } else if id == "ChoosingCityViewTo" {
                    ChoosingCityView(path: $path, selectedCity: $toCity, direction: .to)
                } else if id == "ChoosingStationViewTo" {
                    ChoosingStationView(path: $path, selectedStation: $toCity)
                } else if id == "ChoosingStationViewFrom" {
                    ChoosingStationView(path: $path, selectedStation: $fromCity)
                }  else if id == "TrainScheduleView" {
                    TrainScheduleView(path: $path, filterOptions: $filterOptions, carrier: $carrier)
                } else if id == "FilterScheduleView" {
                    FilterScheduleView(path: $path, filterOptions: $filterOptions)
                } else if id == "CarrierView" {
                    CarrierView(path: $path, carrier: $carrier)
                } else if id == "UserAgreementView" {
                    UserAgreementView()
                        .navigationTitle("Пользовательское соглашение")
                        .navigationBarBackButtonHidden(true)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button(action: {
                                    path.removeLast()
                                    filterOptions = FilterSettings(morningSelected: false, afternoonSelected: false, eveningSelected: false, nightSelected: false, showTransfers: nil)
                                }) {
                                    Image(systemName: "chevron.backward")
                                        .foregroundColor(.ypBlack)
                                }
                            }
                        }
                        .tint(.black)
                }
            }
            .tint(.ypBlack)
        }
    }
}

#Preview {
    MainContentView(isDarkMode: .constant(false))
}

enum Direction {
    case from, to
}
