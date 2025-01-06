//
//  MealController.swift
//  ZakFitServer
//
//  Created by Apprenant 122 on 1/6/25.
//
import Vapor
import Fluent

struct MealController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let meals = routes.grouped("meals")
        meals.get(use: index)
        meals.post(use: create)
        meals.group(":mealID") { meal in
            meal.get(use: show)
            meal.put(use: update)
            meal.delete(use: delete)
        }
    }
}

extension MealController {
    func index(req: Request) async throws -> [Meal] {
        return try await Meal.query(on: req.db)
            .all()
    }

    func create(req: Request) async throws -> Meal {
        let meal = try req.content.decode(Meal.self)
        try await meal.save(on: req.db)
        return meal
    }

    func show(req: Request) async throws -> Meal {
        guard let meal = try await Meal.find(req.parameters.get("mealID"), on: req.db) else {
            throw Abort(.notFound)
        }
        return meal
    }

    func update(req: Request) async throws -> Meal {
        let updatedMeal = try req.content.decode(Meal.self)
        guard let meal = try await Meal.find(req.parameters.get("mealID"), on: req.db) else {
            throw Abort(.notFound)
        }
        meal.type = updatedMeal.type
        meal.date = updatedMeal.date
        try await meal.save(on: req.db)
        return meal
    }

    func delete(req: Request) async throws -> HTTPStatus {
        guard let meal = try await Meal.find(req.parameters.get("mealID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await meal.delete(on: req.db)
        return .noContent
    }
}
