import SwiftUI

@main
struct RoomFitApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .preferredColorScheme(.light)
        }
    }
}
