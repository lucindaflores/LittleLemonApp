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

                if let url = URL(string: dish.image ?? "Image") {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(maxWidth: .infinity)
                    .cornerRadius(10)
                }

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
}

//#Preview {
//    DishDetailView(dish: Dish)
//}
