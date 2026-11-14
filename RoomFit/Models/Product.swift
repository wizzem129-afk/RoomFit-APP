import Foundation
import SwiftUI

// MARK: - Product Model
struct Product: Identifiable, Hashable {
    let id: UUID
    let name: String
    let price: String
    let imageName: String
    let category: String
    let hasARBadge: Bool
    
    init(
        id: UUID = UUID(),
        name: String,
        price: String,
        imageName: String,
        category: String,
        hasARBadge: Bool = true
    ) {
        self.id = id
        self.name = name
        self.price = price
        self.imageName = imageName
        self.category = category
        self.hasARBadge = hasARBadge
    }
}

// MARK: - Sample Data
let sampleProducts: [Product] = [
    Product(
        name: "Alba chair",
        price: "$249 USD",
        imageName: "product_alba",
        category: "Chair",
        hasARBadge: true
    ),
    Product(
        name: "Forma table",
        price: "$179 USD",
        imageName: "product_forma",
        category: "Table",
        hasARBadge: true
    ),
    Product(
        name: "Arc lamp",
        price: "$89 USD",
        imageName: "product_arc",
        category: "Lamp",
        hasARBadge: true
    )
]

// MARK: - Preview
#Preview("Product Model List") {
    ZStack {
        Color.rfCream.ignoresSafeArea()
        
        VStack(alignment: .leading, spacing: 16) {
            Text("Sample Products Data")
                .font(.rfSectionHeading)
                .foregroundColor(.rfDarkGreen)
            
            ForEach(sampleProducts) { product in
                HStack(spacing: 16) {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.rfSage.opacity(0.3))
                        .frame(width: 50, height: 50)
                        .overlay(
                            Text(product.name.prefix(1))
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.rfDarkGreen)
                        )
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(product.name)
                            .font(.rfProductTitle)
                            .foregroundColor(.rfDarkGreen)
                        Text(product.price)
                            .font(.rfPrice)
                            .foregroundColor(.rfGray)
                    }
                    
                    Spacer()
                    
                    if product.hasARBadge {
                        Text("AR")
                            .font(.system(size: 11, weight: .bold))
                            .foregroundColor(.rfDarkGreen)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.white)
                            .clipShape(Capsule())
                    }
                }
                .padding()
                .background(Color.rfCard)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            }
            
            Spacer()
        }
        .padding(20)
    }
}
