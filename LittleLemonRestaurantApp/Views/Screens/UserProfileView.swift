//
//  UserProfile.swift
//  LittleLemonRestaurantApp
//
//  Created by Lucinda Flores on 22/04/2025.
//

import SwiftUI

struct UserProfileView: View {
    
    //This will automatically reference the presentation environment in SwiftUI which will allow you to reach the navigation logic.
    @Environment(\.presentationMode) var presentationMode
    
    let firstNameKey = UserDefaults().string(forKey: "first_name_key") ?? "No first name"
    let lastNameKey = UserDefaults().string(forKey: "last_name_key") ?? "No last name"
    let emailKey = UserDefaults().string(forKey: "email_key") ?? "No email"
    let phoneKey = UserDefaults().string(forKey: "phone_key") ?? "No phone number"
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var phone: String = ""
    
    @State var orderStatus: Bool = false
    @State var passwordChanges: Bool = false
    @State var specialOffers: Bool = false
    @State var newsletter: Bool = false
    
    var body: some View {
        VStack {
            /* Section: Header */
            HStack(spacing: 20) {
                CustomBackButton {
                    self.presentationMode.wrappedValue.dismiss()
                }
                
                Spacer()
                HeaderSection()
            }
            .padding()
            
            /* Section: Personal Information */
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Personal Information")
                        .font(.title2)
                        .bold()
                    
                    HStack(spacing: 20) {
                        // Profile image
                        profileImageView
                        
                        // Buttons to change or remove the profile image
                        VStack(spacing: 10) {
                            Button("Change"){
                                print("Change profile picture")
                            }
                            .buttonStyle(GreenButtonStyle())
                        }
                        
                        Button("Remove") {
                            print("Remove profile picture")
                        }
                        .buttonStyle(WhiteButtonStyle())
                        
                        Spacer()
                    }
                    .padding(.bottom, 10)
                    
                    /* Section: Form */
                    VStack(alignment: .leading, spacing: 5) {
                        FormFields(firstName: $firstName,
                                   lastName: $lastName,
                                   email: $email)
                    }
                    .padding(.bottom, 20)
                    
                    /* Section: Notification Settings */
                    VStack(alignment: .leading) {
                        Text("Email Notifications")
                            .font(.title2)
                            .bold()
                        Group {
                            Toggle("Order status", isOn: $orderStatus)
                            Toggle("Password Changes", isOn: $passwordChanges)
                            Toggle("Special Offers", isOn: $specialOffers)
                            Toggle("Newsletter", isOn: $newsletter)
                        }
                        .tint(Color.primaryColor1)
                        
                    }
                    
                    /* Section: Action buttons */
                    Button {
                        UserDefaults.standard.set(false, forKey: keyIsLoggedIn)
                        //Back to previous screen
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        CTAButton(text: "Log out")
                    }
                    .padding(.top, 20)
                    
                    
                    HStack(spacing: 15) {
                        Button("Discard Changes"){
                            print("Discard Changes")
                        }
                        .buttonStyle(WhiteButtonStyle())

                        Button("  Save changes  ") {
                            print("Save changes")
                        }
                        .buttonStyle(GreenButtonStyle())
                    }
                    .padding(.top, 20)
                }

                .padding()
                .onAppear {
                    firstName = firstNameKey
                    lastName = lastNameKey
                    email = emailKey
                }
            }
        }
    }

}


//MARK: - Previews
#Preview {
    UserProfileView()
        .background(Color.white)
}

//MARK: - Extracted Subviews
var profileImageView: some View {
    Image("Profile")
        .resizable()
        .scaledToFit()
        .frame(width: 80, height: 80)
        .clipShape(Circle())
}




