// MainView.swift
import SwiftUI

struct MainView: View {
    @AppStorage("age") private var age = ""
    @AppStorage("weight") private var weight = ""
    @AppStorage("height") private var height = ""
    @AppStorage("gender") private var gender = "Select Gender"
    
    var body: some View {
        VStack {
            Text("Ideal Fitness Stats")
                .font(.title)
                .padding()
            
            List {
                Text("Age: \(age)")
                Text("Weight: \(weight) kg")
                Text("Height: \(height) cm")
                Text("Gender: \(gender)")
                // Add more here for calculated stats in the future
            }
        }
        .padding()
    }
}

#Preview {
    MainView()
}
