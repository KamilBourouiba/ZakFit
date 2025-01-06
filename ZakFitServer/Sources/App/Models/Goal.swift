//
//  Goal.swift
//  ZakFitServer
//
//  Created by Apprenant 122 on 1/6/25.
//
import Vapor
import Fluent
import FluentMySQLDriver

final class Goal: Model, Content {
    static let schema = "goals"
    
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: "user_id")
    var user: User
    
    @Field(key: "calorie_target")
    var calorieTarget: Int
    
    @Field(key: "activity_minutes")
    var activityMinutes: Int
    
    @Field(key: "weight_target")
    var weightTarget: Double
    
    init() {}
    
    init(id: UUID? = nil, userID: UUID, calorieTarget: Int, activityMinutes: Int, weightTarget: Double) {
        self.id = id
        self.$user.id = userID
        self.calorieTarget = calorieTarget
        self.activityMinutes = activityMinutes
        self.weightTarget = weightTarget
    }
}
