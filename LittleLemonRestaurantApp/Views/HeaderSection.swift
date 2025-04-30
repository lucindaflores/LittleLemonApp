//
//  Header.swift
//  LittleLemonRestaurantApp
//
//  Created by Lucinda Flores on 28/04/2025.
//

import SwiftUI

struct HeaderSection: View {
    var body: some View {
        HStack {
            Rectangle()
                .foregroundStyle(Color.clear)
                .frame(width: 40, height: 40)
                .padding()
            
            Image("LittleLemonLogo")
                .resizable()
                .frame(width: 160, height: 40)
                .padding()
            
            Spacer()
            Image("Profile")
                .resizable()
                .frame(width: 40, height: 40)
                .padding()
        }
    }
}
