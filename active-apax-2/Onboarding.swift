// OnboardingPage.swift
import SwiftUI

struct OnboardingPage: View {
    // @AppStorage properties to save user data
    @AppStorage("age") private var age = ""
    @AppStorage("weight") private var weight = ""
    @AppStorage("height") private var height = ""
    @AppStorage("gender") private var gender = "Select Gender"
    
    // Flag to mark the completion of onboarding
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false
    
    // State variable to temporarily hold selected gender
    @State private var selectedGender = "Select Gender"
    @State private var completedOnboarding = false  // Controls navigation

    // Gender options
    let genders = ["Male", "Female", "Other"]

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Text("Welcome to ActiveApax")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.top, 40)
                
                Text("Your journey to ideal health starts here!")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                
                Spacer()
                
                // Gender Picker
                HStack {
                    Text("Gender:")
                        .foregroundColor(.gray)
                    Spacer()
                    Picker("Gender", selection: $selectedGender) {
                        ForEach(genders, id: \.self) { gender in
                            Text(gender).tag(gender)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                .padding(.horizontal, 30)
                
                // Input fields for age, weight, and height
                TextField("Enter Age", text: $age)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .padding(.horizontal, 30)
                
                TextField("Enter Weight (kg)", text: $weight)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                    .padding(.horizontal, 30)
                
                TextField("Enter Height (cm)", text: $height)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                    .padding(.horizontal, 30)
                
                Spacer()
                
                // Get Started Button to save data and complete onboarding
                Button(action: {
                    self.gender = selectedGender  // Save the selected gender
                    self.hasCompletedOnboarding = true  // Mark onboarding as complete
                    self.completedOnboarding = true
                }) {
                    Text("Get Started")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 40)
                .navigationDestination(isPresented: $completedOnboarding) {
                    MainView()  // Navigate to MainView to display fitness stats
                }

            }
            .background(Color(UIColor.systemGroupedBackground).edgesIgnoringSafeArea(.all))
        }
    }
}

#Preview {
    OnboardingPage()
}
