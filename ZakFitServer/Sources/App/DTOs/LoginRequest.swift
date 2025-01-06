//
//  LoginRequest.swift
//  ZakFitServer
//
//  Created by Apprenant 122 on 1/6/25.
//


import Vapor

struct LoginRequest: Content {
    let email: String
    let password: String
}