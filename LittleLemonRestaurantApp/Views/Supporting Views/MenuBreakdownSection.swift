//
//  HeroSection.swift
//  LittleLemonRestaurantApp
//
//  Created by Lucinda Flores on 28/04/2025.
//
import SwiftUI

struct MenuBreakdownSection: View {
    @Binding var selectedCategory: String?
    let categories = ["Starters", "Mains", "Desserts", "Drinks"]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("ORDER FOR DELIVERY!")
                .foregroundStyle(Color.highlightColor2)
                .font(.headline)
                .fontWeight(.heavy)

            HStack(spacing: 10) {
                ForEach(categories, id: \.self) { category in
                    MenuButton(
                        text: category,
                        isSelected: selectedCategory == category
                    ) {
                        if selectedCategory == category {
                            selectedCategory = nil // Deselect
                        } else {
                            selectedCategory = category // Select
                        }
                    }
                }
            }
        }
        .padding()
    }

}

#Preview {
    MenuBreakdownSection(selectedCategory: .constant("mains"))
}

struct MenuButton: View {
    let text: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .fontWeight(.bold)
                .foregroundStyle(isSelected ? .white : Color.primaryColor1)
                .padding(.horizontal, 10)
                .frame(height: 35)
                .background(isSelected ? Color.primaryColor1 : Color.highlightColor1)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}


