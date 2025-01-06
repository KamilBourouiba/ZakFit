import Fluent
import Vapor

func routes(_ app: Application) throws {
    try app.register(collection: UserController())
    try app.register(collection: GoalController())
    try app.register(collection: MealController())
    try app.register(collection: FoodItemController())
    try app.register(collection: ActivityController())
}
