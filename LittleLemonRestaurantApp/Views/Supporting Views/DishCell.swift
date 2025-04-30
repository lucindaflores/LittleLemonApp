//
//  DishRow.swift
//  LittleLemonRestaurantApp
//
//  Created by Lucinda Flores on 29/04/2025.
//

import SwiftUI

struct DishCell: View {
    
    var dish: Dish
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(dish.title ?? "No title")
                    .font(.headline)
                
                Text(dish.descriptionText ?? "No description")
                    .font(.body)
                    .foregroundStyle(Color.greenPrimary)
                    .padding(.trailing, 5)
                
                Text(dish.price ?? "No price")
                    .font(.callout)
                    .foregroundStyle(Color.greenPrimary)
                    .bold()
            }
            .accessibilityElement(children: .combine)
            
            if let imageUrl = dish.image, let url = URL(string: imageUrl) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .frame(width: 70, height: 70)
                } placeholder: {
                    ProgressView()
                }
            } else {
                Image(systemName: "photo.on.rectangle")
                    .resizable()
                    .frame(width: 70, height: 70)
            }
        }
        .padding(.vertical, 4)
    }
    
}

struct DishCell_Previews: PreviewProvider {
    static var previews: some View {
        DishCell(dish: MockData.createMockDish())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}



