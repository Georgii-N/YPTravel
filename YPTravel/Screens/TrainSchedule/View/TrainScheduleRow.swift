import SwiftUI

struct TrainScheduleRow: View {
    var route: RouteModel
    
    var body: some View {
        VStack(spacing: .zero) {
            HStack {
                Image(.brandIcon)
                    .frame(width: UIConstants.TrainScheduleRow.sideImage, height: UIConstants.TrainScheduleRow.sideImage)
                VStack(spacing: .zero) {
                    
                    HStack(spacing: .zero){
                        Text(route.company)
                            .font(.regularMedium)
                            .foregroundStyle(.ypBlackUniversal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(route.date)
                            .font(.regularSmall)
                            .foregroundStyle(.ypBlackUniversal)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        
                    }
                    Text(route.transferDetails ?? " ")
                        .font(.regularSmall)
                        .foregroundStyle(.ypRed)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding(.top, UIConstants.TrainScheduleRow.mediumInset)
            HStack {
                Text(route.departureTime)
                    .font(.regularMedium)
                    .foregroundStyle(.ypBlackUniversal)

                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(.ypBlackUniversal)

                Text(route.tripDuration)
                    .font(.regularSmall)
                    .foregroundStyle(.ypBlackUniversal)

                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(.ypBlackUniversal)

                Text(route.arrivalTime)
                    .font(.regularMedium)
                    .foregroundStyle(.ypBlackUniversal)
            }
            .padding(.all, UIConstants.TrainScheduleRow.mediumInset)
        }
        .padding(.horizontal)
        .background(.ypLightGray)
        .cornerRadius(UIConstants.TrainScheduleRow.cornerRadius)
    }
}

#Preview {
    TrainScheduleRow(route: RouteModel(company: "ФГК", date: "14 января", transferDetails: "С пересадкой в Костроме", departureTime: "22:30", tripDuration: "20 часов", arrivalTime: "08:15"))
}
