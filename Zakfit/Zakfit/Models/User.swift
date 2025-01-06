//
//  User.swift
//  Zakfit
//
//  Created by Apprenant 122 on 1/5/25.
//
import Foundation

struct User: Identifiable {
    let id: UUID = UUID()
    var name: String
    var email: String
    var password: String
    var weight: Double
    var height: Double
    var dietaryPreferences: String
    var goals: Goals
}
