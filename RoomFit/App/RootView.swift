import SwiftUI

// MARK: - App Screen Destination
enum AppScreen: String {
    case home
    case product
    
    /// Parses launch arguments to determine the initial screen.
    /// Usage: `-screen product` or `-screen home`
    static var initialScreen: AppScreen {
        let arguments = ProcessInfo.processInfo.arguments
        if let screenFlagIndex = arguments.firstIndex(of: "-screen"),
           screenFlagIndex + 1 < arguments.count {
            let requestedScreen = arguments[screenFlagIndex + 1].lowercased()
            if requestedScreen == "product" {
                return .product
            }
        }
        return .home
    }
}

// MARK: - RootView
struct RootView: View {
    @State private var currentScreen: AppScreen
    
    init(initialScreen: AppScreen = AppScreen.initialScreen) {
        _currentScreen = State(initialValue: initialScreen)
    }
    
    var body: some View {
        Group {
            switch currentScreen {
            case .home:
                HomeView()
            case .product:
                ProductView(onBack: {
                    currentScreen = .home
                })
            }
        }
        .preferredColorScheme(.light)
    }
}

// MARK: - Previews
#Preview("RootView - Default (Home)") {
    RootView(initialScreen: .home)
}

#Preview("RootView - Product via Launch Argument") {
    RootView(initialScreen: .product)
}
