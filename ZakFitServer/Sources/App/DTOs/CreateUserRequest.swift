//
//  CreateUserRequest.swift
//  ZakFitServer
//
//  Created by Apprenant 122 on 1/6/25.
//


import Vapor

struct CreateUserRequest: Content {
    var username: String
    var email: String
    var password: String
}