//
//  DashboardView.swift
//  Zakfit
//
//  Created by Apprenant 122 on 1/5/25.
//
import SwiftUI

struct DashboardView: View {
    @ObservedObject var viewModel: AppViewModel

    var body: some View {
        VStack {
            Text("Weekly Summary")
                .font(.largeTitle)
                .padding()

            ChartView(meals: viewModel.mealsForWeek())

            List(viewModel.mealsForWeek()) { meal in
                VStack(alignment: .leading) {
                    Text(meal.type)
                        .font(.headline)
                    ForEach(meal.foodItems) { food in
                        Text("\(food.name) - \(food.calories) cal")
                    }
                }
            }
        }
        .navigationTitle("Dashboard")
    }
}
