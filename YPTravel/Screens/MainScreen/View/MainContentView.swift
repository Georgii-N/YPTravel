import SwiftUI

struct MainContentView: View {
    @State private var text: String = ""
    
    var body: some View {
        
        
        TabView {
            ZStack {
                RouteChoosingView(text: $text)
            }
            .tabItem {
                Image(.tabSchedule)
            }
            
            ZStack {
                RouteChoosingView(text: $text)
            }
            .tabItem {
                Image(.tabSettings)
            }
            
        }
    }
}

#Preview {
    MainContentView()
}
