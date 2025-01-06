//
//  ChartView.swift
//  Zakfit
//
//  Created by Apprenant 122 on 1/5/25.
//
import SwiftUI

struct ChartView: View {
    let meals: [Meal]

    var body: some View {
        VStack {
            Text("Calorie Distribution")
                .font(.headline)
            
            GeometryReader { geometry in
                HStack(spacing: 2) {
                    ForEach(meals, id: \..id) { meal in
                        let totalCalories = meal.foodItems.reduce(0) { $0 + $1.calories }
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: geometry.size.width / CGFloat(meals.count), height: CGFloat(totalCalories))
                    }
                }
            }
            .frame(height: 200)
        }
    }
}
