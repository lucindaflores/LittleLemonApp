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
                header
                
                ZStack {
                    VStack {
                        HeroText()
                    }
                    .padding(.vertical, 20)
                    .padding(.horizontal, 30)
                }
                .background(Color.greenPrimary)

                
                form
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
    private var header: some View {
        HStack {
            Image("LittleLemonLogo")
                .resizable()
                .frame(width: 160, height: 40)
                .padding()
        }
    }
    
    private var form: some View {
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
    
    // Basic email validation
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: email)
    }
    
}
// MARK: - Previews
#Preview {
    OnboardingView()
}


// MARK: - Extensions
extension View {
    func standardTextFieldStyle() -> some View {
        self.textFieldStyle(RoundedBorderTextFieldStyle())
            .foregroundStyle(Color.darkGrayHighlight)
            .autocapitalization(.words)
    }
}





