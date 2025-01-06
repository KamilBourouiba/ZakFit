//
//  Activity.swift
//  ZakFitServer
//
//  Created by Apprenant 122 on 1/6/25.
//
import Vapor
import Fluent
import FluentMySQLDriver

inal class Activity: Model, Content {
    static let schema = "activities"
    
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: "user_id")
    var user: User
    
    @Field(key: "type")
    var type: String
    
    @Field(key: "duration")
    var duration: Int // in minutes
    
    @Field(key: "calories_burned")
    var caloriesBurned: Int
    
    @Field(key: "date")
    var date: Date
    
    init() {}
    
    init(id: UUID? = nil, userID: UUID, type: String, duration: Int, caloriesBurned: Int, date: Date) {
        self.id = id
        self.$user.id = userID
        self.type = type
        self.duration = duration
        self.caloriesBurned = caloriesBurned
        self.date = date
    }
}
