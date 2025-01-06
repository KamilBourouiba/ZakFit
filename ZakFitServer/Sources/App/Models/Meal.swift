//
//  Meal.swift
//  ZakFitServer
//
//  Created by Apprenant 122 on 1/6/25.
//
import Vapor
import Fluent
import FluentMySQLDriver

final class Meal: Model, Content {
    static let schema = "meals"
    
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: "user_id")
    var user: User
    
    @Field(key: "type")
    var type: String // Breakfast, Lunch, Dinner, Snack
    
    @Field(key: "date")
    var date: Date
    
    init() {}
    
    init(id: UUID? = nil, userID: UUID, type: String, date: Date) {
        self.id = id
        self.$user.id = userID
        self.type = type
        self.date = date
    }
}
