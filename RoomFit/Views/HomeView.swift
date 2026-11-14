import SwiftUI

struct HomeView: View {
    var onProductSelected: (Product) -> Void

    init(onProductSelected: @escaping (Product) -> Void = { _ in }) {
        self.onProductSelected = onProductSelected
    }
    
    @State private var searchText: String = ""
    @State private var selectedCategory: String = "All"
    @State private var selectedTab: TabItem = .home
    
    var body: some View {
        ZStack {
            // Screen Background
            Color.rfCream
                .ignoresSafeArea()
            
            // Main Scrollable Content
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 0) {
                    // 1. Header (Brand Title & Favorites Heart Button)
                    HeaderView(onHeartTapped: {
                        selectedTab = .favorites
                    })
                    .padding(.top, 8)
                    .padding(.bottom, 22)
                    
                    // 2. Tagline & 3. Hero Serif Headline
                    VStack(alignment: .leading, spacing: 8) {
                        Text("MAKE ROOM FOR YOUR IDEAS")
                            .font(.system(size: 11, weight: .bold))
                            .tracking(1.4)
                            .foregroundColor(.rfGray)
                        
                        Text("What if you tried it\nat home?")
                            .font(.system(size: 32, weight: .bold, design: .serif))
                            .foregroundColor(.rfDarkGreen)
                            .lineSpacing(2)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 18)
                    
                    // 4. Search Bar
                    SearchBar(text: $searchText)
                        .padding(.bottom, 16)
                    
                    // 5. Horizontal Category Chips
                    CategoryChips(selectedCategory: $selectedCategory)
                        .padding(.bottom, 20)
                    
                    // 6. Hero Armchair Card with "True to scale" Pill
                    HeroCard(imageName: "hero_chair")
                        .padding(.bottom, 18)
                    
                    // 7. & 8. Prominent "Start in AR" Button + Caption
                    ARButton(action: {
                        // Action placeholder for AR scan experience
                    })
                    .padding(.bottom, 28)
                    
                    // 9. Section Title: "Find your next favorite" with "View all"
                    HStack(alignment: .firstTextBaseline) {
                        Text("Find your next favorite")
                            .font(.system(size: 19, weight: .bold))
                            .foregroundColor(.rfDarkGreen)
                        
                        Spacer()
                        
                        Button {
                            // View all action
                        } label: {
                            Text("View all")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.rfGray)
                        }
                        .buttonStyle(.plain)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 14)
                    
                    // 10. Horizontal Product Cards List
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 14) {
                            ForEach(sampleProducts) { product in
                                Button {
                                    onProductSelected(product)
                                } label: {
                                    ProductCard(product: product)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 4)
                    }
                    .padding(.bottom, 30)
                }
            }
            .safeAreaInset(edge: .bottom) {
                // 11. Custom 4-Item Tab Bar
                CustomTabBar(selectedTab: $selectedTab)
            }
        }
    }
}

#Preview("Home Screen - Light Mode") {
    HomeView()
}

#Preview("Home Screen - iPhone SE") {
    HomeView()
        .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
}
