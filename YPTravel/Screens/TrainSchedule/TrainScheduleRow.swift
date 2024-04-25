import SwiftUI

struct TrainScheduleRow: View {
    var body: some View {
        VStack(spacing: .zero) {
            HStack {
                Image(.brandIcon)
                    .frame(width: UIConstants.TrainScheduleRow.sideImage, height: UIConstants.TrainScheduleRow.sideImage)
                VStack(spacing: .zero) {
                    
                    HStack(spacing: .zero){
                        Text("ФГК")
                            .font(.regularMedium)
                            .foregroundStyle(.ypBlackUniversal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("14 января")
                            .font(.regularSmall)
                            .foregroundStyle(.ypBlackUniversal)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        
                    }
                    Text("С пересадкой в Костроме")
                        .font(.regularSmall)
                        .foregroundStyle(.ypRed)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding(.top, UIConstants.TrainScheduleRow.mediumInset)
            HStack {
                Text("22:30")
                    .font(.regularMedium)
                    .foregroundStyle(.ypBlackUniversal)

                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(.ypBlackUniversal)

                Text("20 часов")
                    .font(.regularSmall)
                    .foregroundStyle(.ypBlackUniversal)

                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(.ypBlackUniversal)

                Text("08:15")
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
    TrainScheduleRow()
}
