//
//  LittleLemonRestaurantAppApp.swift
//  LittleLemonRestaurantApp
//
//  Created by Lucinda Flores on 14/04/2025.
//

import SwiftUI

@main
struct LittleLemonRestaurantAppApp: App {
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            OnboardingView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .background(Color.white)
        }
    }
}
