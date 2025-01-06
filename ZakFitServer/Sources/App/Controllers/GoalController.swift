//
//  GoalController.swift
//  ZakFitServer
//
//  Created by Apprenant 122 on 1/6/25.
//
import Vapor
import Fluent

struct GoalController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let goals = routes.grouped("goals")
        goals.get(use: index)
        goals.post(use: create)
        goals.group(":goalID") { goal in
            goal.get(use: show)
            goal.put(use: update)
            goal.delete(use: delete)
        }
    }
}

extension GoalController {
    func index(req: Request) async throws -> [Goal] {
        return try await Goal.query(on: req.db)
            .all()
    }

    func create(req: Request) async throws -> Goal {
        let goal = try req.content.decode(Goal.self)
        try await goal.save(on: req.db)
        return goal
    }

    func show(req: Request) async throws -> Goal {
        guard let goal = try await Goal.find(req.parameters.get("goalID"), on: req.db) else {
            throw Abort(.notFound)
        }
        return goal
    }

    func update(req: Request) async throws -> Goal {
        let updatedGoal = try req.content.decode(Goal.self)
        guard let goal = try await Goal.find(req.parameters.get("goalID"), on: req.db) else {
            throw Abort(.notFound)
        }
        goal.calorieTarget = updatedGoal.calorieTarget
        goal.activityMinutes = updatedGoal.activityMinutes
        goal.weightTarget = updatedGoal.weightTarget
        try await goal.save(on: req.db)
        return goal
    }

    func delete(req: Request) async throws -> HTTPStatus {
        guard let goal = try await Goal.find(req.parameters.get("goalID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await goal.delete(on: req.db)
        return .noContent
    }
}
