import SwiftUI

@main
struct YPTravelApp: App {
    @State private var isDarkMode = false
    
    var body: some Scene {
        WindowGroup {
            MainContentView(isDarkMode: $isDarkMode)
                .preferredColorScheme(isDarkMode ? .dark : .light)
                .environment(\.colorScheme, isDarkMode ? .dark : .light)
        }
    }
}
