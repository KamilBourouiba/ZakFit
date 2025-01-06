//
//  AddMealView.swift
//  Zakfit
//
//  Created by Apprenant 122 on 1/5/25.
//
import SwiftUI

struct AddMealView: View {
    @ObservedObject var viewModel: AppViewModel
    @State private var type: String = "Breakfast"
    @State private var foodItems: [FoodItem] = []
    @State private var foodName: String = ""
    @State private var calories: String = ""

    let mealTypes = ["Breakfast", "Lunch", "Dinner", "Snack"]

    var body: some View {
        VStack {
            Picker("Meal Type", selection: $type) {
                ForEach(mealTypes, id: \..self) { mealType in
                    Text(mealType)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            HStack {
                TextField("Food Name", text: $foodName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                TextField("Calories", text: $calories)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)

                Button("Add Food") {
                    if let cal = Int(calories) {
                        foodItems.append(FoodItem(name: foodName, calories: cal, proteins: 0, carbs: 0, fats: 0))
                        foodName = ""
                        calories = ""
                    }
                }
            }
            .padding()

            List(foodItems) { food in
                Text("\(food.name) - \(food.calories) cal")
            }

            Button("Save Meal") {
                viewModel.logMeal(type: type, foodItems: foodItems)
                foodItems = []
            }
            .padding()
        }
        .navigationTitle("Add Meal")
    }
}
