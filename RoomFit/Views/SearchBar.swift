import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 17, weight: .medium))
                .foregroundColor(.rfGray)
            
            TextField("Search furniture", text: $text)
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(.rfDarkGreen)
            
            if !text.isEmpty {
                Button {
                    text = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 16))
                        .foregroundColor(.rfGray)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, 16)
        .frame(height: 50)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
        .shadow(color: Color.black.opacity(0.04), radius: 8, x: 0, y: 2)
        .padding(.horizontal, 20)
    }
}

#Preview {
    ZStack {
        Color.rfCream.ignoresSafeArea()
        VStack(spacing: 16) {
            SearchBar(text: .constant(""))
            SearchBar(text: .constant("Armchair"))
        }
    }
}
