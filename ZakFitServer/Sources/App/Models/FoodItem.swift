//
//  FoodItem.swift
//  ZakFitServer
//
//  Created by Apprenant 122 on 1/6/25.
//
import Vapor
import Fluent
import FluentMySQLDriver

final class FoodItem: Model, Content {
    static let schema = "food_items"
    
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: "meal_id")
    var meal: Meal
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "calories")
    var calories: Int
    
    @Field(key: "proteins")
    var proteins: Double
    
    @Field(key: "carbs")
    var carbs: Double
    
    @Field(key: "fats")
    var fats: Double
    
    init() {}
    
    init(id: UUID? = nil, mealID: UUID, name: String, calories: Int, proteins: Double, carbs: Double, fats: Double) {
        self.id = id
        self.$meal.id = mealID
        self.name = name
        self.calories = calories
        self.proteins = proteins
        self.carbs = carbs
        self.fats = fats
    }
}
