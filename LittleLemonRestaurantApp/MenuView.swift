//
//  MenuView.swift
//  LittleLemonRestaurantApp
//
//  Created by Lucinda Flores on 14/04/2025.
//

import SwiftUI

struct MenuView: View {
    
    @State private var menuItems: [MenuItem] = []
    @State private var isLoading = true
    @State private var errorMessage: String?
    
    @Environment(\.managedObjectContext) private var viewContext

    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Little Lemon")
                .font(.largeTitle)
                .bold()
            
            Text("Chicago")
                .font(.title3)
                .foregroundColor(.secondary)
            
            Text("We are a family-owned Mediterranean restaurant focused on traditional recipes served with a modern twist.")
                .font(.body)
                .padding(.bottom)
            
            if isLoading {
                ProgressView("Loading menu...")
                    .frame(maxWidth: .infinity, alignment: .center)
            } else if let errorMessage = errorMessage {
                Text("Failed to load menu: \(errorMessage)")
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
            } else {
                List(menuItems) { item in
                    VStack(alignment: .leading) {
                        Text(item.title)
                        Text(item.description)
                        Text("$\(item.price)").font(.caption).foregroundColor(.secondary)
                    }
                    .padding(.vertical, 4)
                }
            }
        }
        .padding()
        .task {
            await loadMenu()
        }
    }
    
    // MARK: - Async fetch function
    private func loadMenu() async {
        do {
            let items = try await NetworkManager.shared.getMenuData()
            menuItems = items
            isLoading = false
        } catch {
            errorMessage = error.localizedDescription
            isLoading = false
        }
    }
}

#Preview {
    MenuView()
}
