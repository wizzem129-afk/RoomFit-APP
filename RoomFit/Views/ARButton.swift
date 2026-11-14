import SwiftUI

struct ARButton: View {
    var action: () -> Void = {}
    
    var body: some View {
        VStack(spacing: 8) {
            Button(action: action) {
                HStack(spacing: 14) {
                    Image(systemName: "arkit")
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(.rfDarkGreen)
                    
                    Text("Start in AR")
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
            .buttonStyle(ARButtonPressStyle())
            
            // Centered helper caption
            Text("Scan your room, then place a piece.")
                .font(.system(size: 13, weight: .regular))
                .foregroundColor(.rfGray)
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal, 20)
    }
}

// Subtle press interaction for tactile feedback
private struct ARButtonPressStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .opacity(configuration.isPressed ? 0.92 : 1.0)
            .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
}

#Preview {
    ZStack {
        Color.rfCream.ignoresSafeArea()
        ARButton()
    }
}
