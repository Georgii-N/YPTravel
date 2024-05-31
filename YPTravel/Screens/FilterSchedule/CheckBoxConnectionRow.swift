import SwiftUI

struct CheckBoxConnectionRow: View {
    var title: String
    @Binding var showTransfers: String?
    
    var body: some View {
        HStack {
            Text(title)
                .font(.regularMedium)
            Spacer()
            Circle()
                .strokeBorder(.ypBlack, lineWidth: UIConstants.CheckBox.borderWidth)
                .background(
                    Circle()
                        .fill(showTransfers == title ? Color.ypBlack : Color.clear)
                        .frame(width: UIConstants.CheckBox.checkBoxCircle, height: UIConstants.CheckBox.checkBoxCircle)
                )
                .frame(width: UIConstants.CheckBox.checkBoxSide, height: UIConstants.CheckBox.checkBoxSide)
                .onTapGesture {
                    showTransfers = title
                }
        }
        .padding(.vertical)
        .foregroundColor(.ypBlack)
    }
}

#Preview {
    CheckBoxConnectionRow(title: "Да", showTransfers: .constant(""))
}
