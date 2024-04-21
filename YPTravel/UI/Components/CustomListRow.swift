import SwiftUI

struct CustomListRow: View {
    private var text: String
    
    init(text: String) {
        self.text = text
    }
    
    var body: some View {
        
    HStack {
        Text(text)
            .padding(.vertical, UIConstants.paddingRow)
            .font(.regularMedium)
        Spacer()
        Image(.arrow)
    }
    
    
    .listRowSeparator(.hidden)
    }
}

#Preview {
    CustomListRow(text: "Moscow")
}
