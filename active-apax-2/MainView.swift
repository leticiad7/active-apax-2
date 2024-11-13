// MainView.swift
import SwiftUI

struct MainView: View {
    @AppStorage("age") private var age = ""
    @AppStorage("weight") private var weight = ""
    @AppStorage("height") private var height = ""
    @AppStorage("gender") private var gender = "Select Gender"
    
    @State private var idealStats: [String: String] = [:]
    @State private var showingProgressTracking = false

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
                Divider()
                ForEach(idealStats.keys.sorted(), id: \.self) { key in
                    HStack {
                        Text(key)
                        Spacer()
                        Text(idealStats[key]!)
                    }
                }
            }
            .padding()
            
            Button(action: {
                showingProgressTracking = true
            }) {
                Text("Track Your Progress")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding(.top, 20)
            .fullScreenCover(isPresented: $showingProgressTracking) {
                ProgressTrackingView(idealStats: idealStats)
            }
        }
        .onAppear(perform: calculateIdealStats)
    }

    private func calculateIdealStats() {
        if let ageInt = Int(age), let weightDouble = Double(weight), let heightDouble = Double(height) {
            let userStats = UserStats(age: ageInt, weight: weightDouble, height: heightDouble)
            idealStats = IdealStatsCalculator.calculateIdealStats(for: userStats)
        }
    }
}

#Preview {
    MainView()
}
