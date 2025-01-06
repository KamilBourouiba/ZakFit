//
//  FoodItemController.swift
//  ZakFitServer
//
//  Created by Apprenant 122 on 1/6/25.
//
import Vapor
import Fluent

struct FoodItemController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let foodItems = routes.grouped("foodItems")
        foodItems.get(use: index)
        foodItems.post(use: create)
        foodItems.group(":foodItemID") { foodItem in
            foodItem.get(use: show)
            foodItem.put(use: update)
            foodItem.delete(use: delete)
        }
    }
}

extension FoodItemController {
    func index(req: Request) async throws -> [FoodItem] {
        return try await FoodItem.query(on: req.db).all()
    }

    func create(req: Request) async throws -> FoodItem {
        let foodItem = try req.content.decode(FoodItem.self)
        try await foodItem.save(on: req.db)
        return foodItem
    }

    func show(req: Request) async throws -> FoodItem {
        guard let foodItem = try await FoodItem.find(req.parameters.get("foodItemID"), on: req.db) else {
            throw Abort(.notFound)
        }
        return foodItem
    }

    func update(req: Request) async throws -> FoodItem {
        let updatedFoodItem = try req.content.decode(FoodItem.self)
        guard let foodItem = try await FoodItem.find(req.parameters.get("foodItemID"), on: req.db) else {
            throw Abort(.notFound)
        }
        foodItem.name = updatedFoodItem.name
        foodItem.calories = updatedFoodItem.calories
        foodItem.proteins = updatedFoodItem.proteins
        foodItem.carbs = updatedFoodItem.carbs
        foodItem.fats = updatedFoodItem.fats
        try await foodItem.save(on: req.db)
        return foodItem
    }

    func delete(req: Request) async throws -> HTTPStatus {
        guard let foodItem = try await FoodItem.find(req.parameters.get("foodItemID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await foodItem.delete(on: req.db)
        return .noContent
    }
}
