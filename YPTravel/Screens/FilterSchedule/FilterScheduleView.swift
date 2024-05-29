import SwiftUI

struct FilterScheduleView: View {
    @Binding var path: [String]
    @Binding var filterOptions: FilterSettings
    
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Text("Время отправления")
                        .font(.boldMedium)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    CheckboxRow(title: "Утро 06:00 - 12:00", isSelected: $filterOptions.morningSelected)
                    CheckboxRow(title: "День 12:00 - 18:00", isSelected: $filterOptions.afternoonSelected)
                    CheckboxRow(title: "Вечер 18:00 - 00:00", isSelected: $filterOptions.eveningSelected)
                    CheckboxRow(title: "Ночь 00:00 - 16:00", isSelected: $filterOptions.nightSelected)
                    Text("Показывать варианты с пересадками")
                        .font(.boldMedium)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    CheckBoxConnectionRow(title: "Да", showTransfers: $filterOptions.showTransfers)
                    CheckBoxConnectionRow(title: "Нет", showTransfers: $filterOptions.showTransfers)
                }
                .padding()
                
                Spacer()
                
                if filterOptions.morningSelected || filterOptions.afternoonSelected || filterOptions.eveningSelected || filterOptions.nightSelected || filterOptions.showTransfers != nil {
                    Button("Применить") {
                        let trainScheduleCount = path.filter { $0 == "TrainScheduleView" }.count
                        if trainScheduleCount > 1 {
                            path.removeLast()
                        } else {
                            path.append("TrainScheduleView")
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
        }
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

#Preview {
    FilterScheduleView(path: .constant([]), filterOptions: .constant(FilterSettings(morningSelected: false, afternoonSelected: false, eveningSelected: false, nightSelected: false, showTransfers: nil)))
}
