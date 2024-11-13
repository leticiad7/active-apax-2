// IdealStatsCalculator.swift
import Foundation

class IdealStatsCalculator {
    static func calculateIdealStats(for userStats: UserStats) -> [String: String] {
        var idealStats: [String: String] = [:]
        
        // Example logic for cardiovascular endurance
        if userStats.age < 30 {
            idealStats["Cardiovascular Endurance"] = "Run 2.4 km in 10-12 min"
        } else if userStats.age < 50 {
            idealStats["Cardiovascular Endurance"] = "Run 2.4 km in 12-14 min"
        } else {
            idealStats["Cardiovascular Endurance"] = "Run 2.4 km in 14-16 min"
        }
        
        // Example logic for muscular strength
        if userStats.weight > 80 {
            idealStats["Muscular Strength"] = "Bodyweight bench press or 6-8 push-ups"
        } else {
            idealStats["Muscular Strength"] = "Bodyweight bench press or 8-10 push-ups"
        }
        
        // Example logic for muscular endurance
        if userStats.age < 40 {
            idealStats["Muscular Endurance"] = "20-25 push-ups, plank 1-2 min"
        } else {
            idealStats["Muscular Endurance"] = "15-20 push-ups, plank 1 min"
        }
        
        // Example logic for flexibility
        if userStats.age < 35 {
            idealStats["Flexibility"] = "Touch toes, sit and reach 20-25 cm"
        } else {
            idealStats["Flexibility"] = "Touch knees, sit and reach 15-20 cm"
        }
        
        // Example logic for body composition
        if userStats.age < 40 {
            idealStats["Body Composition"] = "18-24% body fat"
        } else {
            idealStats["Body Composition"] = "20-28% body fat"
        }

        return idealStats
    }
}
