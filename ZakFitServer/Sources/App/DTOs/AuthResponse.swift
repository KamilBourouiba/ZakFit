//
//  AuthResponse.swift
//  ZakFitServer
//
//  Created by Apprenant 122 on 1/6/25.
//


import Vapor

struct AuthResponse: Content {
    let user: UserDTO
    let token: String
}