//
//  AppViewModel.swift
//  Zakfit
//
//  Created by Apprenant 122 on 1/5/25.
//
import SwiftUI

class AppViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var meals: [Meal] = []
    @Published var activities: [Activity] = []
    @Published var loggedInUser: User?

    init() {
        loadMockData()
    }

    func loadMockData() {
        let mockGoals = Goals(calorieTarget: 2000, activityMinutes: 150, weightTarget: 70.0)
        let mockUser = User(name: "John Doe", email: "john.doe@example.com", password: "password123", weight: 75.0, height: 180.0, dietaryPreferences: "Vegetarian", goals: mockGoals)
        users.append(mockUser)

        let mockFoodItem1 = FoodItem(name: "Oatmeal", calories: 150, proteins: 5, carbs: 27, fats: 3)
        let mockFoodItem2 = FoodItem(name: "Banana", calories: 100, proteins: 1, carbs: 23, fats: 0.3)
        meals.append(Meal(type: "Breakfast", foodItems: [mockFoodItem1, mockFoodItem2], date: Date()))

        let mockActivity = Activity(type: "Running", duration: 30, caloriesBurned: 300)
        activities.append(mockActivity)

        print("Loaded mock data.")
    }

    func login(email: String, password: String) -> Bool {
        if let user = users.first(where: { $0.email == email && $0.password == password }) {
            loggedInUser = user
            print("SQL: SELECT * FROM Users WHERE email='\(email)' AND password='\(password)'")
            print("User logged in: \(user.name)")
            return true
        } else {
            print("SQL: SELECT * FROM Users WHERE email='\(email)' AND password='\(password)' - No match")
            return false
        }
    }

    func logMeal(type: String, foodItems: [FoodItem]) {
        let meal = Meal(type: type, foodItems: foodItems, date: Date())
        meals.append(meal)
        print("SQL: INSERT INTO Meals VALUES (\(meal))")
    }

    func logActivity(activity: Activity) {
        activities.append(activity)
        print("SQL: INSERT INTO Activities VALUES (\(activity))")
    }

    func addGoal(calorieTarget: Int, activityMinutes: Int, weightTarget: Double) {
        loggedInUser?.goals = Goals(calorieTarget: calorieTarget, activityMinutes: activityMinutes, weightTarget: weightTarget)
        print("SQL: UPDATE Users SET goals=\(loggedInUser?.goals) WHERE id='\(loggedInUser?.id.uuidString ?? "")'")
    }

    func mealsForWeek() -> [Meal] {
        let calendar = Calendar.current
        let weekAgo = calendar.date(byAdding: .day, value: -7, to: Date()) ?? Date()
        return meals.filter { $0.date >= weekAgo }
    }
}
