import SwiftUI

struct ProductCard: View {
    let product: Product
    var onSelect: () -> Void = {}
    
    var body: some View {
        Button(action: onSelect) {
            VStack(alignment: .leading, spacing: 8) {
                // Product Image Container with Floating "AR" Badge
                ZStack(alignment: .topTrailing) {
                    productImageView
                        .frame(width: 130, height: 115)
                        .background(Color(hex: 0xF2ECE4))
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                    
                    if product.hasARBadge {
                        Text("AR")
                            .font(.system(size: 10, weight: .bold))
                            .foregroundColor(.rfDarkGreen)
                            .padding(.horizontal, 7)
                            .padding(.vertical, 3)
                            .background(Color.white)
                            .clipShape(Capsule())
                            .shadow(color: Color.black.opacity(0.08), radius: 4, x: 0, y: 1)
                            .padding(8)
                    }
                }
                
                // Product Metadata
                VStack(alignment: .leading, spacing: 3) {
                    Text(product.name)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.rfDarkGreen)
                        .lineLimit(1)
                    
                    Text(product.price)
                        .font(.system(size: 13, weight: .regular))
                        .foregroundColor(.rfGray)
                        .lineLimit(1)
                }
                .padding(.horizontal, 4)
                .padding(.bottom, 4)
            }
            .padding(8)
            .background(Color.rfCard)
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
            .shadow(color: Color.black.opacity(0.04), radius: 8, x: 0, y: 3)
        }
        .buttonStyle(.plain)
    }
    
    @ViewBuilder
    private var productImageView: some View {
        if UIImage(named: product.imageName) != nil {
            Image(product.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 130, height: 115)
                .clipped()
        } else {
            // Contextual fallback icon matching product category
            ZStack {
                Color(hex: 0xF0ECE5)
                
                Image(systemName: iconName(for: product.category))
                    .font(.system(size: 42))
                    .foregroundColor(iconColor(for: product.category))
            }
        }
    }
    
    private func iconName(for category: String) -> String {
        switch category.lowercased() {
        case "chair":
            return "chair.lounge.fill"
        case "table":
            return "table.furniture.fill"
        case "lamp":
            return "lamp.table.fill"
        default:
            return "cube.fill"
        }
    }
    
    private func iconColor(for category: String) -> Color {
        switch category.lowercased() {
        case "chair":
            return .rfSage
        case "table":
            return Color(hex: 0xC8A882)
        case "lamp":
            return Color(hex: 0xD4C4B5)
        default:
            return .rfGray
        }
    }
}

#Preview {
    ZStack {
        Color.rfCream.ignoresSafeArea()
        HStack(spacing: 12) {
            ProductCard(product: sampleProducts[0])
            ProductCard(product: sampleProducts[1])
            ProductCard(product: sampleProducts[2])
        }
        .padding()
    }
}
