import SwiftUI

struct MainContentView: View {
    
    var body: some View {
        Text("Я")
        CustomButton(title: "Я") {
            
        }
        .background(.ypBlack)
    }
}

#Preview {
    MainContentView()
}
