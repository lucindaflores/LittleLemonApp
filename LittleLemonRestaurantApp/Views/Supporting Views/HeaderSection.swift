//
//  Header.swift
//  LittleLemonRestaurantApp
//
//  Created by Lucinda Flores on 28/04/2025.
//

import SwiftUI

struct HeaderSection: View {
    var logoImageName: String = "LittleLemonLogo"
    var profileImageName: String = "Profile"
    var body: some View {
        HStack {
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

#Preview {
    HeaderSection()
}
