//
//  Dish+CoreDataProperties.swift
//  LittleLemonRestaurantApp
//
//  Created by Lucinda Flores on 24/04/2025.
//
//

import Foundation
import CoreData

extension Dish {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dish> {
        return NSFetchRequest<Dish>(entityName: "Dish")
    }

    @NSManaged public var title: String?
    @NSManaged public var image: String?
    @NSManaged public var price: String?
    @NSManaged public var descriptionText: String?
    @NSManaged public var id: Int32
    @NSManaged public var category: String?

    
}

extension Dish : Identifiable {

}
