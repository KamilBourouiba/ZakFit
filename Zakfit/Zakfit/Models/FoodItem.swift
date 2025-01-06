//
//  FoodItem.swift
//  Zakfit
//
//  Created by Apprenant 122 on 1/5/25.
//
import Foundation

struct FoodItem: Identifiable {
    let id: UUID = UUID()
    var name: String
    var calories: Int
    var proteins: Double
    var carbs: Double
    var fats: Double
}
