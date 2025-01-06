//
//  Meal.swift
//  Zakfit
//
//  Created by Apprenant 122 on 1/5/25.
//
import Foundation

struct Meal: Identifiable {
    let id: UUID = UUID()
    var type: String
    var foodItems: [FoodItem]
    var date: Date
}
