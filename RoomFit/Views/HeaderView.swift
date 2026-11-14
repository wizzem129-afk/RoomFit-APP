import SwiftUI

struct HeaderView: View {
    var onHeartTapped: () -> Void = {}
    
    var body: some View {
        HStack(alignment: .center) {
            Text("RoomFit")
                .font(.system(size: 28, weight: .bold, design: .serif))
                .foregroundColor(.rfDarkGreen)
            
            Spacer()
            
            Button(action: onHeartTapped) {
                Image(systemName: "heart")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.rfDarkGreen)
                    .frame(width: 44, height: 44)
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.06), radius: 6, x: 0, y: 2)
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    ZStack {
        Color.rfCream.ignoresSafeArea()
        HeaderView()
    }
}
