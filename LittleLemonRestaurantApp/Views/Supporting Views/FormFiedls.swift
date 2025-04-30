//
//  FormFiedls.swift
//  LittleLemonRestaurantApp
//
//  Created by Lucinda Flores on 30/04/2025.
//

import SwiftUI

struct FormFields: View {
    
    @Binding var firstName: String
    @Binding var lastName: String
    @Binding var email: String
    
    var body: some View {
        Text("First Name *")
            .foregroundStyle(Color.darkGrayHighlight.opacity(0.8))
            .bold()
        TextField("", text: $firstName)
            .standardTextFieldStyle()
            .padding(.bottom, 15)
        
        Text("Last Name *")
            .foregroundStyle(Color.darkGrayHighlight.opacity(0.8))
            .bold()
        TextField("", text: $lastName)
            .standardTextFieldStyle()
            .padding(.bottom, 15)
        
        Text("Email *")
            .foregroundStyle(Color.darkGrayHighlight.opacity(0.8))
            .bold()
        TextField("", text: $email)
            .standardTextFieldStyle()
            .keyboardType(.emailAddress)
            .autocapitalization(.none)
    }
    
}

#Preview {
    FormFields(firstName: .constant("Test"), lastName: .constant("Test"), email: .constant("email@test.test"))
}
