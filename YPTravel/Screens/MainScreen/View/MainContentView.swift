import SwiftUI

struct MainContentView: View {
    
    @State private var path: [String] = []
    
    var body: some View {
        NavigationStack(path: $path) {
        TabView() {
                ZStack {
                    RouteChoosingView(path: $path)
                }
                .navigationDestination(for: String.self) { id in
                    if id == "ChoosingCityView" {
                        ChoosingCityView(path: $path)
                    }
                }
                .tabItem {
                    Label("", image: "tabSchedule")
                }
                
                ZStack {
                    Text("2")
                }
                .tabItem {
                    Label("", image: "tabSettings")
                }
            }
            .tint(.black)
        }
    }
}

#Preview {
    MainContentView()
}
