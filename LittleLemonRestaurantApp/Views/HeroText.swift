//
//  HeroSection.swift
//  LittleLemonRestaurantApp
//
//  Created by Lucinda Flores on 28/04/2025.
//
import SwiftUI

struct HeroText: View {
    
    var body: some View {
            HStack {
                VStack(alignment: .leading) {
                    Text("Little Lemon")
                        .foregroundStyle(Color.yellowPrimary)
                        .font(.title)
                        .bold()
                    
                    Text("Chicago")
                        .font(.title2)
                        .foregroundStyle(.white)
                        .padding(.bottom)
                    
                    Text("We are a family-owned Mediterranean restaurant focused on traditional recipes served with a modern twist.")
                        .font(.body)
                        .foregroundStyle(.white)
                        .padding(.bottom)
                }
                
                Image("HeroImage")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
    }
}


#Preview {
    HeroText()
}
