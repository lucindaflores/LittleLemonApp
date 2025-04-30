//
//  CustomBackButton.swift
//  LittleLemonRestaurantApp
//
//  Created by Lucinda Flores on 30/04/2025.
//

import SwiftUI

struct CustomBackButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "arrow.left.circle.fill")
                .font(.largeTitle) 
                .foregroundColor(Color.greenPrimary)
        }
    }
}

#Preview {
    CustomBackButton(action: {})
}
