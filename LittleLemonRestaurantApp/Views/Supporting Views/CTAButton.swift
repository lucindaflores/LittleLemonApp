//
//  CTOButton.swift
//  LittleLemonRestaurantApp
//
//  Created by Lucinda Flores on 29/04/2025.
//

import SwiftUI

struct CTAButton: View {
    @State var text: String
    
    var body: some View {
        Text(text)
            .fontWeight(.heavy)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.primaryColor2)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .foregroundColor(.highlightColor2)
    }
}

#Preview {
    CTAButton(text: "Order now")
}
