import SwiftUI

struct HeroCard: View {
    var imageName: String = "hero_chair"
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            // Main Hero Image / Visual
            heroImageView
                .frame(maxWidth: .infinity)
                .frame(height: 280)
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
        if UIImage(named: imageName) != nil {
            Image(imageName)
                .resizable()
                .scaledToFill()
        } else {
            // Graceful visual fallback with warm interior tones & stylized armchair
            ZStack {
                LinearGradient(
                    colors: [
                        Color(hex: 0xECE5DC),
                        Color(hex: 0xDFD6CB)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                
                // Floor line accent
                VStack {
                    Spacer()
                    Rectangle()
                        .fill(Color(hex: 0xCFBFB0))
                        .frame(height: 50)
                }
                
                // Stylized sage armchair graphic
                VStack(spacing: 8) {
                    Image(systemName: "chair.lounge.fill")
                        .font(.system(size: 80))
                        .foregroundColor(.rfSage)
                        .shadow(color: Color.black.opacity(0.12), radius: 10, x: 0, y: 6)
                    
                    Text("Living Room • Alba Collection")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.rfGray)
                }
                .offset(y: -10)
            }
        }
    }
}

#Preview {
    ZStack {
        Color.rfCream.ignoresSafeArea()
        HeroCard()
    }
}
