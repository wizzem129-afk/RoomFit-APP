import SwiftUI

enum TabItem: String, CaseIterable {
    case home = "Home"
    case catalog = "Catalog"
    case favorites = "Favorites"
    case cart = "Cart"
    
    var iconName: String {
        switch self {
        case .home:
            return "house"
        case .catalog:
            return "square.grid.2x2"
        case .favorites:
            return "heart"
        case .cart:
            return "cart"
        }
    }
}

struct CustomTabBar: View {
    @Binding var selectedTab: TabItem
    
    var body: some View {
        VStack(spacing: 0) {
            // Hairline separator
            Divider()
                .background(Color.rfBorder.opacity(0.5))
            
            HStack {
                ForEach(TabItem.allCases, id: \.self) { tab in
                    let isSelected = (tab == selectedTab)
                    
                    Button {
                        selectedTab = tab
                    } label: {
                        VStack(spacing: 4) {
                            if isSelected {
                                // Selected tab pill badge behind icon
                                Image(systemName: tab.iconName)
                                    .font(.system(size: 17, weight: .semibold))
                                    .foregroundColor(.rfDarkGreen)
                                    .frame(width: 48, height: 28)
                                    .background(Color.rfSage)
                                    .clipShape(Capsule())
                            } else {
                                Image(systemName: tab.iconName)
                                    .font(.system(size: 18, weight: .regular))
                                    .foregroundColor(.rfGray)
                                    .frame(width: 48, height: 28)
                            }
                            
                            Text(tab.rawValue)
                                .font(.system(size: 11, weight: isSelected ? .bold : .medium))
                                .foregroundColor(isSelected ? .rfDarkGreen : .rfGray)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.top, 8)
            .padding(.bottom, 6)
            .background(Color.white)
        }
        .background(Color.white.ignoresSafeArea(edges: .bottom))
        .shadow(color: Color.black.opacity(0.04), radius: 10, x: 0, y: -2)
    }
}

#Preview {
    ZStack(alignment: .bottom) {
        Color.rfCream.ignoresSafeArea()
        CustomTabBar(selectedTab: .constant(.home))
    }
}
