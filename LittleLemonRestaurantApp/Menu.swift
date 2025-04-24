//
//  Menu.swift
//  LittleLemonRestaurantApp
//
//  Created by Lucinda Flores on 23/04/2025.
//
import Foundation

struct Menu: Codable {
    let menu: [MenuItem]
}


struct MenuItem: Codable, Identifiable{
    var id: Int //{ title } // Derived ID if title is unique
    var title: String
    var description: String
    var price: String
    var image: String
    var category: String
}

