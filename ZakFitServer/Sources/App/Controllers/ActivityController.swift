//
//  ActivityController.swift
//  ZakFitServer
//
//  Created by Apprenant 122 on 1/6/25.
//
import Vapor
import Fluent

struct ActivityController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let activities = routes.grouped("activities")
        activities.get(use: index)
        activities.post(use: create)
        activities.group(":activityID") { activity in
            activity.get(use: show)
            activity.put(use: update)
            activity.delete(use: delete)
        }
    }
}

extension ActivityController {
    func index(req: Request) async throws -> [Activity] {
        return try await Activity.query(on: req.db).all()
    }

    func create(req: Request) async throws -> Activity {
        let activity = try req.content.decode(Activity.self)
        try await activity.save(on: req.db)
        return activity
    }

    func show(req: Request) async throws -> Activity {
        guard let activity = try await Activity.find(req.parameters.get("activityID"), on: req.db) else {
            throw Abort(.notFound)
        }
        return activity
    }

    func update(req: Request) async throws -> Activity {
        let updatedActivity = try req.content.decode(Activity.self)
        guard let activity = try await Activity.find(req.parameters.get("activityID"), on: req.db) else {
            throw Abort(.notFound)
        }
        activity.type = updatedActivity.type
        activity.duration = updatedActivity.duration
        activity.caloriesBurned = updatedActivity.caloriesBurned
        try await activity.save(on: req.db)
        return activity
    }

    func delete(req: Request) async throws -> HTTPStatus {
        guard let activity = try await Activity.find(req.parameters.get("activityID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await activity.delete(on: req.db)
        return .noContent
    }
}
