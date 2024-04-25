import SwiftUI

struct TrainScheduleView: View {
    var body: some View {
        VStack() {
            Text("Москва (Ярославский вокзал) → Санкт Петербург (Балтийский вокзал) ")
                .foregroundStyle(.ypBlackUniversal)
                .font(.boldMedium)
            
            LazyVStack(spacing: 4) {
                ForEach(1...6, id: \.self) { index in
                    TrainScheduleRow()
                }
            }
        }
        .padding()
    }
}

#Preview {
    TrainScheduleView()
}
