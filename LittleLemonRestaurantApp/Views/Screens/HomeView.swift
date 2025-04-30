//
//  Home.swift
//  LittleLemonRestaurantApp
//
//  Created by Lucinda Flores on 14/04/2025.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        TabView {
            MenuView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
                
            UserProfileView()
                .tabItem {
                    Label("Profile", systemImage: "square.and.pencil")
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomeView()
}
