import SwiftUI

// MARK: - Color Swatch Model
struct ColorSwatch: Identifiable {
    let id = UUID()
    let name: String
    let color: Color
}

struct ProductView: View {
    var onBack: () -> Void = {}
    
    @State private var isFavorite: Bool = false
    @State private var selectedColorIndex: Int = 0
    
    // 4 color dots (sage, blue, pink, orange)
    private let swatches: [ColorSwatch] = [
        ColorSwatch(name: "Sage", color: .rfSage),
        ColorSwatch(name: "Blue", color: Color(hex: 0x8FA5B5)),
        ColorSwatch(name: "Pink", color: Color(hex: 0xE5B6A5)),
        ColorSwatch(name: "Orange", color: .rfOrange)
    ]
    
    var body: some View {
        ZStack {
            // Cream Background #F7F0E8
            Color.rfCream
                .ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 0) {
                    // 1. Top Bar: Round Back Button (Left) & Round Heart Button (Right)
                    topBar
                        .padding(.top, 8)
                        .padding(.bottom, 18)
                    
                    // 2. Small uppercase label & Big serif title
                    VStack(alignment: .leading, spacing: 6) {
                        Text("ARMCHAIR")
                            .font(.system(size: 11, weight: .bold))
                            .tracking(1.4)
                            .foregroundColor(.rfGray)
                        
                        Text("Alba chair")
                            .font(.system(size: 32, weight: .bold, design: .serif))
                            .foregroundColor(.rfDarkGreen)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 16)
                    
                    // 3. Large photo using hero_chair with "True to scale" pill
                    photoCard
                        .padding(.bottom, 20)
                    
                    // 4. Row of 4 color dots (sage, blue, pink, orange)
                    colorDotsRow
                        .padding(.bottom, 22)
                    
                    // 5. Price & 2-line description
                    VStack(alignment: .leading, spacing: 8) {
                        Text("$249 USD")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.rfDarkGreen)
                        
                        Text("Soft sage bouclé fabric and solid oak legs. Comfortable and made to last.")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.rfGray)
                            .lineSpacing(3)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 26)
                    
                    // 6. Big orange pill button "View in your room" (Most visible)
                    viewInRoomButton
                        .padding(.bottom, 12)
                    
                    // 7. White secondary button "Add to Cart" with orange border
                    addToCartButton
                        .padding(.bottom, 32)
                }
            }
        }
    }
    
    // MARK: - 1. Top Bar
    private var topBar: some View {
        HStack {
            // Round Back Arrow Button
            Button(action: onBack) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.rfDarkGreen)
                    .frame(width: 44, height: 44)
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.06), radius: 6, x: 0, y: 2)
            }
            .buttonStyle(.plain)
            
            Spacer()
            
            // Round Heart Button
            Button {
                isFavorite.toggle()
            } label: {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(isFavorite ? .rfOrange : .rfDarkGreen)
                    .frame(width: 44, height: 44)
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.06), radius: 6, x: 0, y: 2)
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 20)
    }
    
    // MARK: - 3. Large Photo with "True to scale" Pill
    private var photoCard: some View {
        ZStack(alignment: .topLeading) {
            heroImageView
                .frame(maxWidth: .infinity)
                .frame(height: 290)
                .clipped()
            
            // "True to scale" Floating Badge
            HStack(spacing: 6) {
                Image(systemName: "ruler")
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(.rfDarkGreen)
                
                Text("True to scale")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(.rfDarkGreen)
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
            .background(Color.white.opacity(0.95))
            .clipShape(Capsule())
            .shadow(color: Color.black.opacity(0.08), radius: 6, x: 0, y: 2)
            .padding(14)
        }
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        .shadow(color: Color.black.opacity(0.06), radius: 12, x: 0, y: 4)
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder
    private var heroImageView: some View {
        if UIImage(named: "hero_chair") != nil {
            Image("hero_chair")
                .resizable()
                .scaledToFill()
        } else {
            // Elegant fallback if asset catalog is empty
            ZStack {
                LinearGradient(
                    colors: [Color(hex: 0xECE5DC), Color(hex: 0xDFD6CB)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                Image(systemName: "chair.lounge.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.rfSage)
            }
        }
    }
    
    // MARK: - 4. Color Swatches Row
    private var colorDotsRow: some View {
        HStack(spacing: 14) {
            ForEach(0..<swatches.count, id: \.self) { index in
                let swatch = swatches[index]
                let isSelected = (index == selectedColorIndex)
                
                Button {
                    selectedColorIndex = index
                } label: {
                    ZStack {
                        // Outer ring for selected dot
                        if isSelected {
                            Circle()
                                .stroke(Color.rfDarkGreen, lineWidth: 2)
                                .frame(width: 36, height: 36)
                        }
                        
                        // Solid color dot
                        Circle()
                            .fill(swatch.color)
                            .frame(width: 26, height: 26)
                            .shadow(color: swatch.color.opacity(0.3), radius: 3, x: 0, y: 1)
                    }
                    .frame(width: 38, height: 38)
                }
                .buttonStyle(.plain)
            }
            
            Spacer()
        }
        .padding(.horizontal, 20)
    }
    
    // MARK: - 6. "View in your room" Orange Pill Button
    private var viewInRoomButton: some View {
        Button {
            // Placeholder for AR viewer flow
        } label: {
            HStack(spacing: 14) {
                Image(systemName: "arkit")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(.rfDarkGreen)
                
                Text("View in your room")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.rfDarkGreen)
                
                Spacer()
                
                Image(systemName: "arrow.right")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.rfDarkGreen)
            }
            .padding(.horizontal, 24)
            .frame(maxWidth: .infinity)
            .frame(height: 58)
            .background(Color.rfOrange)
            .clipShape(Capsule())
            .shadow(color: Color.rfOrange.opacity(0.45), radius: 14, x: 0, y: 7)
        }
        .buttonStyle(ProductButtonPressStyle())
        .padding(.horizontal, 20)
    }
    
    // MARK: - 7. "Add to Cart" Secondary Button
    private var addToCartButton: some View {
        Button {
            // Placeholder for Cart action
        } label: {
            Text("Add to Cart")
                .font(.system(size: 17, weight: .bold))
                .foregroundColor(.rfOrange)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(Color.white)
                .clipShape(Capsule())
                .overlay(
                    Capsule()
                        .stroke(Color.rfOrange, lineWidth: 2)
                )
                .shadow(color: Color.black.opacity(0.03), radius: 6, x: 0, y: 2)
        }
        .buttonStyle(ProductButtonPressStyle())
        .padding(.horizontal, 20)
    }
}

// MARK: - Press Animation
private struct ProductButtonPressStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .opacity(configuration.isPressed ? 0.92 : 1.0)
            .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
}

// MARK: - Preview
#Preview("Product Page - Alba Chair") {
    ProductView()
}

#Preview("Product Page - iPhone SE") {
    ProductView()
        .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
}
