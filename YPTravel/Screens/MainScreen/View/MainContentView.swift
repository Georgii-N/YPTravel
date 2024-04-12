import SwiftUI

struct MainContentView: View {
    @State private var text: String = ""
    @State private var selection = 0
    
    var body: some View {
        
        TabView(selection: $selection) {
            ZStack {
                RouteChoosingView(text: $text)
            }
            .tabItem {
                Label("", image: "tabSchedule")
            }
            .tag(0)
            
            ZStack {
                Text(text)
            }
            .tabItem {
                Label("", image: "tabSettings")
            }
            .tag(1)
        }
        .tint(.black)
    }
}

#Preview {
    MainContentView()
}
