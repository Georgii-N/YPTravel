import SwiftUI

struct CheckboxRow: View {
    let title: String
    @Binding var isSelected: Bool

    var body: some View {
        Button(action: {
            self.isSelected.toggle()
        }) {
            HStack {
                Text(title)
                    .font(.regularMedium)
                Spacer()
                Image(systemName: isSelected ? "checkmark.square" : "square")
                    .resizable()
                    .frame(width: UIConstants.CheckBox.checkBoxSide,
                           height: UIConstants.CheckBox.checkBoxSide)
            }
        }
        .padding(.vertical)
        .foregroundColor(.ypBlack)
    }
}

#Preview {
    CheckboxRow(title: "12-14", isSelected: .constant(false))
}
