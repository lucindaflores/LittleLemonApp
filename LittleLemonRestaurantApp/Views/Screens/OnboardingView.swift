//
//  ContentView.swift
//  LittleLemonRestaurantApp
//
//  Created by Lucinda Flores on 14/04/2025.
//

import SwiftUI

// MARK: - View
struct OnboardingView: View {
    
    // TextField values
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    
    @State var isLoggedIn: Bool = false
    
    // Navigation
    @State private var showHomeScreen: Bool = false
    
    // Alerts
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                /* Section: Header */
                HStack {
                    Image("LittleLemonLogo")
                        .resizable()
                        .frame(width: 160, height: 40)
                        .padding()
                }
                
                /* Section: Hero */
                ZStack {
                    VStack {
                        HeroText()
                    }
                    .padding(.vertical, 20)
                    .padding(.horizontal, 30)
                }
                .background(Color.primaryColor1)

                /* Section: Form */
                VStack(alignment: .leading, spacing: 5) {
                    
                    FormFields(firstName: $firstName,
                               lastName: $lastName,
                               email: $email)
                        
                    Button {
                        registerUser()
                    } label: {
                        CTAButton(text: "Register")
                    }
                    .padding(.top, 30)
                }
                .padding()
            }
            //.padding()
            .alert("Invalid Input", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(alertMessage)
            }
            .navigationDestination(isPresented: $showHomeScreen) {
                HomeView()
                    .navigationBarBackButtonHidden(true)
            }
            .onAppear {
                if UserDefaults.standard.bool(forKey: keyIsLoggedIn) {
                    showHomeScreen = true
                }
                
                firstName = " "
                lastName = " "
                email = " "
            }
            
            Spacer()
        }
    }
    
    // MARK: - Extracted subviews
    private var registerButton: some View {
        Button {
            registerUser()
        } label: {
            CTAButton(text: "Register")
        }
    }
    
    // MARK: - Helper functions
    
    // Validates user's entered fields
    func registerUser() {
        if firstName.isEmpty || lastName.isEmpty || email.isEmpty {
            alertMessage = "Please fill in all fields."
            showAlert = true
            isLoggedIn = true
        } else if !isValidEmail(email) {
            alertMessage = "Please enter a valid email address."
            showAlert = true
        } else {
            // Save data to UserDefaults
            UserDefaults.standard.set(firstName, forKey: keyFirstName)
            UserDefaults.standard.set(lastName, forKey: keyLastName)
            UserDefaults.standard.set(email, forKey: keyEmail)
            UserDefaults.standard.set(true, forKey: keyIsLoggedIn)
            
            // Navigate to Home
            showHomeScreen = true
        }
    }
    

    
}
// MARK: - Previews
#Preview {
    OnboardingView()
}







