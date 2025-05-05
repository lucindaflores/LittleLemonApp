//
//  UsefulFunctionz.swift
//  LittleLemonRestaurantApp
//
//  Created by Lucinda Flores on 05/05/2025.
//

import Foundation


    // Price formatting
    func formatPrice(_ price : String) -> String {
        if let priceFloat = Float(price) {
            let spacing = priceFloat < 10 ? " " : ""
            return "$" + spacing + String(format: "%.2f", priceFloat)
        } else {
            return "Price not available"//"$0.00"
        }
    }
    
    // Basic email validation
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: email)
    }

