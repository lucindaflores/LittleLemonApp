//
//  Styles.swift
//  LittleLemonRestaurantApp
//
//  Created by Lucinda Flores on 05/05/2025.
//
import SwiftUI


// MARK: -  TextField Style
extension TextField {
    func standardTextFieldStyle() -> some View {
        self.textFieldStyle(RoundedBorderTextFieldStyle())
            .foregroundStyle(Color.highlightColor2)
            .autocapitalization(.words)
    }
}


// MARK: - Button Styles
    struct GreenButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .background(Color.primaryColor1)
                .foregroundColor(.white)
                .bold()
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
    
    struct WhiteButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .background(Color.white)
                .foregroundColor(Color.primaryColor1)
                .bold()
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.primaryColor1, lineWidth: 4))
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }

