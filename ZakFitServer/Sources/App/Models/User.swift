//
//  User.swift
//  ZakFitServer
//
//  Created by Apprenant 122 on 1/6/25.
//
import Vapor
import Fluent
import FluentMySQLDriver

final class User: Model, Content {
    static let schema = "users"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "email")
    var email: String
    
    @Field(key: "password")
    var password: String
    
    @Field(key: "weight")
    var weight: Double
    
    @Field(key: "height")
    var height: Double
    
    @Field(key: "dietary_preferences")
    var dietaryPreferences: String
    
    init() {}
    
    init(id: UUID? = nil, name: String, email: String, password: String, weight: Double, height: Double, dietaryPreferences: String) {
        self.id = id
        self.name = name
        self.email = email
        self.password = password
        self.weight = weight
        self.height = height
        self.dietaryPreferences = dietaryPreferences
    }
}
