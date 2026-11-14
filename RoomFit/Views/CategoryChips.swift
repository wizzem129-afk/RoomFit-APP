import SwiftUI

struct CategoryChips: View {
    let categories: [String] = ["All", "Sofa", "Chair", "Table", "Lamp"]
    @Binding var selectedCategory: String
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(categories, id: \.self) { category in
                    let isSelected = (category == selectedCategory)
                    
                    Button {
                        selectedCategory = category
                    } label: {
                        Text(category)
                            .font(.system(size: 14, weight: isSelected ? .semibold : .medium))
                            .foregroundColor(isSelected ? .white : .rfDarkGreen)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(
                                Capsule()
                                    .fill(isSelected ? Color.rfSage : Color.white)
                            )
                            .shadow(color: isSelected ? Color.rfSage.opacity(0.3) : Color.black.opacity(0.04), radius: 6, x: 0, y: 2)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 2)
        }
    }
}

#Preview {
    ZStack {
        Color.rfCream.ignoresSafeArea()
        VStack(spacing: 20) {
            CategoryChips(selectedCategory: .constant("All"))
            CategoryChips(selectedCategory: .constant("Chair"))
        }
    }
}
