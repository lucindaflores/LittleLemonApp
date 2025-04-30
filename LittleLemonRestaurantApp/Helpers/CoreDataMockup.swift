//
//  CoreDataMockup.swift
//  LittleLemonRestaurantApp
//
//  Created by Lucinda Flores on 30/04/2025.
//

import CoreData

struct CoreDataMock {

    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ExampleDatabase")
        let description = NSPersistentStoreDescription()
        description.type = NSInMemoryStoreType // Use in-memory store
        container.persistentStoreDescriptions = [description]
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    static var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

}

struct MockData {
    static func createMockDish() -> Dish {
        let dish = Dish(context: CoreDataMock.context)
        dish.title = "Spaghetti Carbonara"
        dish.descriptionText = "A classic Italian dish with eggs, cheese, bacon, and black pepper."
        dish.price = "$12.99"
        dish.image = "https://example.com/image.jpg" // Use a valid URL or a placeholder image in your assets
        dish.id = 1
        dish.category = "Pasta"
        return dish
    }
}
