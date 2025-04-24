//
//  Home.swift
//  LittleLemonRestaurantApp
//
//  Created by Lucinda Flores on 14/04/2025.
//

import SwiftUI

struct HomeView: View {
    
    let persistenceController = PersistenceController.shared
    
    var body: some View {
        TabView {
            MenuView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Menu")
                }
                
            
            UserProfileView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Profile")
                }
        }
        .navigationBarBackButtonHidden(true)
        .environment(\.managedObjectContext, persistenceController.container.viewContext)
    }
}

#Preview {
    HomeView()
}
