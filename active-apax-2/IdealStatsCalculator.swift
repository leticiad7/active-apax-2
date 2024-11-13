//
//  Untitled.swift
//  active-apax-2
//
//  Created by Leticia Amorim Domingos on 13/11/2024.
//

// IdealStatsCalculator.swift
import Foundation

class IdealStatsCalculator {
    static func calculateIdealStats(for userStats: UserStats) -> [String: String] {
        var idealStats: [String: String] = [:]

        // Sample fitness benchmarks based on general fitness standards
        idealStats["Cardiovascular Endurance"] = "Run 2.4 km in 10-12 min"
        idealStats["Muscular Strength"] = "Bodyweight bench press or 8-10 push-ups"
        idealStats["Muscular Endurance"] = "20-25 push-ups, plank 1-2 min"
        idealStats["Flexibility"] = "Touch toes, sit and reach 20-25 cm"
        idealStats["Body Composition"] = "18-25% body fat"
        
        return idealStats
    }
}
