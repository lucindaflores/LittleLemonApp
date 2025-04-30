//
//  DishDetailView.swift
//  LittleLemonRestaurantApp
//
//  Created by Lucinda Flores on 24/04/2025.
//

import SwiftUI

struct DishDetailView: View {
    let dish: Dish

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(dish.title ?? "Title")
                    .font(.largeTitle)
                    .bold()

                DishImageView(imageURL: dish.image)

                Text("Price: $\(String(describing: dish.price))")
                    .font(.title3)

                Text("Category: \(String(describing: dish.category))")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Divider()

                Text(dish.descriptionText ?? "Description" )
                    .font(.body)

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Dish Details")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    
    struct DishImageView: View {
        let imageURL: String?
        
        var body: some View {
            if let urlString = imageURL, let url = URL(string: urlString) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .success(let image):
                        image.resizable().aspectRatio(contentMode: .fit)
                    case .failure:
                        Image(systemName: "photo")
                    case .empty:
                        ProgressView()
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(maxWidth: .infinity)
                .cornerRadius(10)
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 200)
                    .cornerRadius(10)
                    .padding()
            }
        }
    }
}

#Preview {
    DishDetailView(dish: MockData.createMockDish())
}
