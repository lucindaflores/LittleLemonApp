//
//  HeroSection.swift
//  LittleLemonRestaurantApp
//
//  Created by Lucinda Flores on 28/04/2025.
//
import SwiftUI

struct MenuBreakdownSection: View {
    
    var body: some View {
        
        let categories = ["Starters", "Mains", "Desserts", "Drinks"]

        VStack(alignment: .leading) {
            
            Text("ORDER FOR DELIVERY!")
                .foregroundStyle(Color.darkGrayHighlight)
                .font(.headline)
                .fontWeight(.heavy)

            HStack(spacing: 10) {
                ForEach(categories, id: \.self) { category in
                    MenuButton(text: category)
                }
            }
        }
        .padding()
    }

}

#Preview {
    MenuBreakdownSection()
}

struct MenuButton: View {
    
    @State var text: String
    
    var body: some View {
        Button {
            print("Button pressed")
        } label: {
            Text(text)
                .fontWeight(.bold)
                .foregroundStyle(Color.greenPrimary)
        }
        .frame(height: 35, alignment: .center)
        .padding(.horizontal, 10)
        .background(Color.lightGreenSecondary)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
