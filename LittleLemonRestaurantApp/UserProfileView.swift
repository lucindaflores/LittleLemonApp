//
//  UserProfile.swift
//  LittleLemonRestaurantApp
//
//  Created by Lucinda Flores on 22/04/2025.
//

import SwiftUI

struct UserProfileView: View {
    
    //his will automatically reference the presentation environment in SwiftUI which will allow you to reach the navigation logic.
    @Environment(\.presentationMode) var presentation
    
    //let keyFirstName: String = "first_name_key"
    let firstName = UserDefaults().string(forKey: "first_name_key") ?? "No first name"
    let lastName = UserDefaults().string(forKey: "last_name_key") ?? "No last name"
    let email = UserDefaults().string(forKey: "email_key") ?? "No email"
    
    
    var body: some View {
        VStack {
            Text("Personal Information")
            Image("profile-image-placeholder")
                .resizable()
                .frame(width: 100, height: 100)
            
            Text("First Name: \(firstName)")
            Text("Last Name: \(lastName)")
            Text("Email: \(email)")
            
            
            Button {
                UserDefaults.standard.set(false, forKey: keyIsLoggedIn)
                //Back to previous screen
                self.presentation.wrappedValue.dismiss()
                
            } label: {
                Text("Logout")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.systemGroupedBackground))
    }
}

#Preview {
    UserProfileView()
}
