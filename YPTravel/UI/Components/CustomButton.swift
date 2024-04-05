import SwiftUI

struct CustomButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .foregroundColor(.white)
                .padding()
                .background(.blue)
                .cornerRadius(UIConstants.cornerRadius)
        }
    }
}
