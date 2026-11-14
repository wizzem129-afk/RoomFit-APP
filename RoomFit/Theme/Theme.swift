import SwiftUI

// MARK: - RoomFit Theme Colors
extension Color {
    /// Cream background #F7F0E8 - Primary background tone of the entire screen
    static let rfCream = Color(hex: 0xF7F0E8)
    
    /// Card background #FCF9F5 - Clean, warm surface tone for cards and containers
    static let rfCard = Color(hex: 0xFCF9F5)
    
    /// Sage green #9CAF94 - Accent color for active chips and selected tab pill
    static let rfSage = Color(hex: 0x9CAF94)
    
    /// Vibrant orange #E8894F - High-visibility call-to-action color for "Start in AR"
    static let rfOrange = Color(hex: 0xE8894F)
    
    /// Dark green text #2F3E34 - Deep, earthy primary typography and brand color
    static let rfDarkGreen = Color(hex: 0x2F3E34)
    
    /// Gray text #8A857D - Muted secondary text, labels, and placeholders
    static let rfGray = Color(hex: 0x8A857D)
    
    /// Subtle divider and border tone
    static let rfBorder = Color(hex: 0xE6DDD4)
    
    // MARK: - Hex Initializer
    /// Initializes a Color from a 24-bit hex integer (e.g. `Color(hex: 0xF7F0E8)`)
    init(hex: UInt, alpha: Double = 1.0) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0,
            opacity: alpha
        )
    }
}

// MARK: - Typography Presets
extension Font {
    /// Large Serif Title ("What if you tried it at home?")
    static let rfHeroTitle = Font.system(size: 32, weight: .bold, design: .serif)
    
    /// Brand Logo Serif ("RoomFit")
    static let rfLogo = Font.system(size: 26, weight: .bold, design: .serif)
    
    /// Uppercase Tagline ("MAKE ROOM FOR YOUR IDEAS")
    static let rfTagline = Font.system(size: 11, weight: .bold, design: .default)
    
    /// Section Heading ("Find your next favorite")
    static let rfSectionHeading = Font.system(size: 19, weight: .bold, design: .default)
    
    /// Product Title ("Alba chair")
    static let rfProductTitle = Font.system(size: 15, weight: .semibold, design: .default)
    
    /// Product Price & Subtitles ("$249 USD")
    static let rfPrice = Font.system(size: 13, weight: .medium, design: .default)
    
    /// Chip & Button Text
    static let rfButton = Font.system(size: 17, weight: .bold, design: .default)
    
    /// Small Badge Text ("AR", "True to scale")
    static let rfBadge = Font.system(size: 12, weight: .semibold, design: .default)
}

// MARK: - Preview
#Preview("Color Palette") {
    ScrollView {
        VStack(spacing: 16) {
            Text("RoomFit Design System")
                .font(.rfHeroTitle)
                .foregroundColor(.rfDarkGreen)
                .multilineTextAlignment(.center)
                .padding(.top, 20)
            
            VStack(spacing: 12) {
                ColorSwatchRow(name: "rfCream (#F7F0E8)", color: .rfCream, textColor: .rfDarkGreen)
                ColorSwatchRow(name: "rfCard (#FCF9F5)", color: .rfCard, textColor: .rfDarkGreen)
                ColorSwatchRow(name: "rfSage (#9CAF94)", color: .rfSage, textColor: .white)
                ColorSwatchRow(name: "rfOrange (#E8894F)", color: .rfOrange, textColor: .rfDarkGreen)
                ColorSwatchRow(name: "rfDarkGreen (#2F3E34)", color: .rfDarkGreen, textColor: .white)
                ColorSwatchRow(name: "rfGray (#8A857D)", color: .rfGray, textColor: .white)
            }
            .padding(.horizontal, 20)
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom, 40)
    }
    .background(Color.rfCream.ignoresSafeArea())
}

private struct ColorSwatchRow: View {
    let name: String
    let color: Color
    let textColor: Color
    
    var body: some View {
        HStack {
            Text(name)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(textColor)
            Spacer()
        }
        .padding()
        .frame(height: 54)
        .background(color)
        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .stroke(Color.black.opacity(0.06), lineWidth: 1)
        )
    }
}
