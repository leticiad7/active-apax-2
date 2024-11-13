// ProgressTrackingView.swift
import SwiftUI

struct ProgressTrackingView: View {
    var idealStats: [String: String]
    
    @State private var currentRunTime = ""
    @State private var currentPushUps = ""
    @State private var currentPlankTime = ""
    
    @State private var progressFeedback: [String] = []

    var body: some View {
        VStack(spacing: 16) {
            Text("Track Your Current Stats")
                .font(.title)
                .padding()

            // Input fields for user's current stats
            HStack {
                Text("Run Time (min):")
                Spacer()
                TextField("e.g., 12", text: $currentRunTime)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                    .frame(width: 80)
            }

            HStack {
                Text("Push-Ups:")
                Spacer()
                TextField("e.g., 15", text: $currentPushUps)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .frame(width: 80)
            }

            HStack {
                Text("Plank Time (min):")
                Spacer()
                TextField("e.g., 1.5", text: $currentPlankTime)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                    .frame(width: 80)
            }

            Button(action: calculateProgress) {
                Text("Calculate Progress")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding(.top, 20)

            // Display Feedback
            ForEach(progressFeedback, id: \.self) { feedback in
                Text(feedback)
                    .font(.body)
                    .padding(.top, 5)
                    .foregroundColor(.green)
            }
            
            Spacer()
        }
        .padding()
    }

    private func calculateProgress() {
        // Convert input fields to appropriate data types
        let runTime = Double(currentRunTime) ?? 0.0
        let pushUps = Int(currentPushUps) ?? 0
        let plankTime = Double(currentPlankTime) ?? 0.0
        
        var feedback: [String] = []

        // Compare run time
        if let idealRunTime = idealStats["Cardiovascular Endurance"], let idealRun = Double(idealRunTime.split(separator: " ")[0]) {
            if runTime <= idealRun {
                feedback.append("Great job! Your run time meets the ideal benchmark.")
            } else {
                feedback.append("Keep working on your run time. Aim for \(idealRun) minutes or less.")
            }
        }

        // Compare push-ups
        if let idealPushUpsText = idealStats["Muscular Strength"], let idealPushUps = Int(idealPushUpsText.split(separator: " ")[0]) {
            if pushUps >= idealPushUps {
                feedback.append("Excellent! Your push-up count meets the ideal benchmark.")
            } else {
                feedback.append("Try to increase your push-ups to at least \(idealPushUps) for the ideal level.")
            }
        }

        // Compare plank time
        if let idealPlankTime = idealStats["Muscular Endurance"], let idealPlank = Double(idealPlankTime.split(separator: " ")[1].replacingOccurrences(of: "min", with: "")) {
            if plankTime >= idealPlank {
                feedback.append("Awesome! Your plank time meets the ideal benchmark.")
            } else {
                feedback.append("Keep working on your plank time. Aim for at least \(idealPlank) minutes.")
            }
        }

        // Update progress feedback to display on screen
        progressFeedback = feedback
    }
}

#Preview {
    ProgressTrackingView(idealStats: [
        "Cardiovascular Endurance": "10",
        "Muscular Strength": "8",
        "Muscular Endurance": "2 min"
    ])
}
