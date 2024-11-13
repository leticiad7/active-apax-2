import SwiftUI

struct MainView: View {
    @AppStorage("age") private var age = ""
    @AppStorage("weight") private var weight = ""
    @AppStorage("height") private var height = ""
    @AppStorage("gender") private var gender = "Select Gender"
    
    @State private var idealStats: [String: String] = [:]

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
        }
        .padding()
        .onAppear(perform: calculateIdealStats) // Calculate stats when view appears
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
