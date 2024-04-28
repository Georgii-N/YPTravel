import SwiftUI

struct FilterView: View {
    @State private var morningSelected = false
    @State private var afternoonSelected = false
    @State private var eveningSelected = false
    @State private var nightSelected = false
    @State private var showTransfers = false

    var body: some View {
        VStack {
            Text("Время отправления")
                .font(.boldMedium)
                .frame(maxWidth: .infinity, alignment: .leading)
            CheckboxRow(title: "Утро 06:00 - 12:00", isSelected: $morningSelected)
            CheckboxRow(title: "День 12:00 - 18:00", isSelected: $afternoonSelected)
            CheckboxRow(title: "Вечер 18:00 - 00:00", isSelected: $eveningSelected)
            CheckboxRow(title: "Ночь 00:00 - 16:00", isSelected: $nightSelected)
        }
        .padding()
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
