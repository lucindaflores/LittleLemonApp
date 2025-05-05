//
//  UsefulFunctionz.swift
//  LittleLemonRestaurantApp
//
//  Created by Lucinda Flores on 05/05/2025.
//

import Foundation

struct UsefulFunctions {
    func formatPrice(_ price : String) -> String {
        if let priceFloat = Float(price) {
            let spacing = priceFloat < 10 ? " " : ""
            return "$" + spacing + String(format: "%.2f", priceFloat)
        } else {
            return "$0.00"
        }
    }
}
