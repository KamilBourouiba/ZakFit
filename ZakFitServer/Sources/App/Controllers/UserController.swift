//
//  UserController.swift
//  ZakFitServer
//
//  Created by Apprenant 122 on 1/6/25.
//
import Vapor
import Fluent

struct UserController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let users = routes.grouped("users")
        users.get(use: index)
        users.post(use: create)
        users.group(":userID") { user in
            user.get(use: show)
            user.put(use: update)
            user.delete(use: delete)
        }
    }
}

extension UserController {
    func index(req: Request) async throws -> [User] {
        return try await User.query(on: req.db)
            .sort(\.$name, .ascending)
            .all()
    }

    func create(req: Request) async throws -> User {
        let user = try req.content.decode(User.self)
        try await user.save(on: req.db)
        return user
    }

    func show(req: Request) async throws -> User {
        guard let user = try await User.find(req.parameters.get("userID"), on: req.db) else {
            throw Abort(.notFound)
        }
        return user
    }

    func update(req: Request) async throws -> User {
        let updatedUser = try req.content.decode(User.self)
        guard let user = try await User.find(req.parameters.get("userID"), on: req.db) else {
            throw Abort(.notFound)
        }
        user.name = updatedUser.name
        user.email = updatedUser.email
        user.password = updatedUser.password
        user.weight = updatedUser.weight
        user.height = updatedUser.height
        user.dietaryPreferences = updatedUser.dietaryPreferences
        try await user.save(on: req.db)
        return user
    }

    func delete(req: Request) async throws -> HTTPStatus {
        guard let user = try await User.find(req.parameters.get("userID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await user.delete(on: req.db)
        return .noContent
    }
}
