//
//  Activity.swift
//  Zakfit
//
//  Created by Apprenant 122 on 1/5/25.
//
import Foundation

struct Activity: Identifiable {
    let id: UUID = UUID()
    var type: String // e.g., Cardio, Strength
    var duration: Int // in minutes
    var caloriesBurned: Int
}
