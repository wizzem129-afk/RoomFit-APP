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
            ZStack {
                Color(hex: 0xF2ECE4)
                
                Image(product.imageName)
                    .resizable()
                    .scaledToFill()
                    .scaleEffect(imageScale(for: product.imageName))
                    .offset(imageOffset(for: product.imageName))
                    .frame(width: 130, height: 115)
            }
            .frame(width: 130, height: 115)
            .clipped()
            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
        } else {
            // Contextual fallback icon matching product category
            ZStack {
                Color(hex: 0xF0ECE5)
                
                Image(systemName: iconName(for: product.category))
                    .font(.system(size: 42))
                    .foregroundColor(iconColor(for: product.category))
            }
            .frame(width: 130, height: 115)
            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
        }
    }
    
    // MARK: - Framing Helpers for Custom Crops
    private func imageScale(for imageName: String) -> CGFloat {
        switch imageName {
        case "product_arc":
            // Scale slightly so both the shade at the top and the stand at the bottom fit inside the 115pt height
            return 0.88
        case "product_forma":
            // Keep table prominent and centered
            return 1.08
        case "product_alba":
            // Center the armchair from the temporary hero_chair image
            return 1.35
        default:
            return 1.0
        }
    }
    
    private func imageOffset(for imageName: String) -> CGSize {
        switch imageName {
        case "product_arc":
            // Shift right to bring the lamp (on the left of the scene) into the center of the frame
            return CGSize(width: 32, height: 0)
        case "product_forma":
            // Align slightly down so the table, vase, and rug surface are fully visible
            return CGSize(width: 0, height: -10)
        case "product_alba":
            // Center the armchair from the temporary hero_chair image
            return CGSize(width: -28, height: -38)
        default:
            return .zero
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
