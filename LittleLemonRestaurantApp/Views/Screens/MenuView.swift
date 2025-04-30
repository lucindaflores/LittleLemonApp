//
//  MenuView.swift
//  LittleLemonRestaurantApp
//
//  Created by Lucinda Flores on 14/04/2025.
//

import SwiftUI
import CoreData

struct MenuView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var isLoading = true
    @State private var errorMessage: String?
    @State private var searchText: String = ""
    @State private var shouldFetchData = true
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack {
                    Rectangle()
                        .foregroundStyle(Color.clear)
                        .frame(width: 40, height: 40)
                        .padding()
                    HeaderSection()
                }
                .padding(.horizontal)
                searchAndHeroText
                
                MenuBreakdownSection()
                
                Divider()
                    .foregroundStyle(Color.darkGrayHighlight)
                
                contentSection
                
            }
            .task {
                if shouldFetchData {
                    Task {
                        await loadMenuIntoCoreData()
                    }
                }
            }
        }
        
    }
    
    // MARK: - Extracted subviews
    private var searchAndHeroText: some View {
        VStack {
            HeroText()
            TextField("􀊫 Search menu", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 10)
        }
        .padding(.vertical, 20)
        .padding(.horizontal)
        .background(Color.greenPrimary)
    }
    
    private var contentSection: some View {
        Group {
            if isLoading {
                ProgressView("Loading menu...")
                    .frame(maxWidth: .infinity, alignment: .center)
            } else if let errorMessage = errorMessage {
                Text("Failed to load menu: \(errorMessage)")
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
            } else {
                menuList
            }
        }
    }
    
    private var menuList: some View {
        FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
            List(dishes, id: \.self) { dish in
                NavigationLink(destination: DishDetailView(dish: dish)) {
                    DishCell(dish: dish)
                }
            }
            .listStyle(.plain) // Improving list appearance
        }
    }
    
    // MARK: - Async fetch function
    private func loadMenuIntoCoreData() async {
        do {
            // Clear the database
            PersistenceController.shared.clear()
            
            // Fetch fresh data
            let menuItems = try await NetworkManager.shared.getMenuData()
            
            // Map and save into Core Data
            for item in menuItems {
                
                let fetchRequest: NSFetchRequest<Dish> = Dish.fetchRequest()
                fetchRequest.predicate = NSPredicate(format: "id == %d", Int32(item.id))

                let results = try viewContext.fetch(fetchRequest)

                if results.isEmpty {
                    let dish = Dish(context: viewContext)
                    dish.id = Int32(item.id)
                    dish.title = item.title
                    dish.price = item.price
                    dish.descriptionText = item.description
                    dish.image = item.image
                    dish.category = item.category
                    shouldFetchData = false
                } else {
                    // Update existing items if necessary
                    print("update existing items if necessary")
                }
            }
            
            try viewContext.save()
            isLoading = false
        } catch {
            errorMessage = error.localizedDescription
            isLoading = false
        }
    }
    
    // MARK: - Sorting and filtering Step 1: Build Sort Descriptors
    private func buildSortDescriptors() -> [NSSortDescriptor] {
        return [
            NSSortDescriptor(
                key: "title",
                ascending: true,
                selector: #selector(NSString.localizedStandardCompare)
            )
        ]
    }
    
    // MARK: - Sorting and filtering Step 4: Build Predicate
    private func buildPredicate() -> NSPredicate {
        if searchText.isEmpty {
            return NSPredicate(value: true) // No filtering
        } else {
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
    }
}

#Preview {
    MenuView()
        .background(Color.white)
}


