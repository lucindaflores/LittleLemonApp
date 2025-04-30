//
//  DishRow.swift
//  LittleLemonRestaurantApp
//
//  Created by Lucinda Flores on 29/04/2025.
//

import SwiftUI

struct DishCell: View {
    
    let title: String
    let description: String
    let price: String
    let image: String?
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .font(.headline)
                
                Text(description)
                    .font(.body)
                    .foregroundStyle(Color.greenPrimary)
                    .padding(.trailing, 5)
                
                Text(price)
                    .font(.callout)
                    .foregroundStyle(Color.greenPrimary)
                    .bold()
                
            }
            
            if let url = URL(string: image) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .frame(width: 70, height: 70)
                } placeholder: {
                    ProgressView()
                }
            }
        }
    }
}

#Preview {
    DishCell(title: "Dish Title", description: "Dish Description", price: "$12.99", image: "Lemon dessert")
        .frame(height: 150, alignment: .leading)
}
