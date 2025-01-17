//
//  Activity.swift
//  Zakfit
//
//  Created by Apprenant 122 on 1/5/25.
//
import Foundation

struct Activity: Identifiable {
    let id: UUID = UUID()
    var type: String
    var duration: Int
    var caloriesBurned: Int
}
