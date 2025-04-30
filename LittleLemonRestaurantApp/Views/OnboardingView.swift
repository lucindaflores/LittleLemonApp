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
    @State private var path: [NavigationTarget] = []
    
    // Alerts
    @State private var showAlert = false
    @State private var alertMessage = ""

    let networkManager = NetworkManager.shared
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 20) {
                TextField("First name", text: $firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.words)
                
                TextField("Last name", text: $lastName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.words)
                
                TextField("email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                
                Button("Register") {
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
                        path.append(.home) // ➡️ Trigger navigation
                    }
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green.opacity(0.8))
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding()
            
            .navigationDestination(for: NavigationTarget.self) { target in
 
                switch target {
                case .home:
                    HomeView()
                        .navigationBarBackButtonHidden(true)
                }
                
            }
            
            .alert("Invalid Input", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(alertMessage)
            }
            
            .onAppear {
                if UserDefaults.standard.bool(forKey: keyIsLoggedIn) {
                    path.append(.home)
                    //networkManager.getMenuData()
                }
            }
        }

    }
    
    // Basic email validation
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: email)
    }
}

#Preview {
    OnboardingView()
}
