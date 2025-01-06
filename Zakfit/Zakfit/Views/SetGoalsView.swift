//
//  SetGoalsView.swift
//  Zakfit
//
//  Created by Apprenant 122 on 1/5/25.
//
import SwiftUI

struct SetGoalsView: View {
    @ObservedObject var viewModel: AppViewModel
    @State private var calorieTarget: String = ""
    @State private var activityMinutes: String = ""
    @State private var weightTarget: String = ""

    var body: some View {
        VStack {
            TextField("Calorie Target", text: $calorieTarget)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .padding()

            TextField("Activity Minutes", text: $activityMinutes)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .padding()

            TextField("Weight Target", text: $weightTarget)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .padding()

            Button("Save Goals") {
                if let calTarget = Int(calorieTarget), let actMinutes = Int(activityMinutes), let weight = Double(weightTarget) {
                    viewModel.addGoal(calorieTarget: calTarget, activityMinutes: actMinutes, weightTarget: weight)
                    calorieTarget = ""
                    activityMinutes = ""
                    weightTarget = ""
                }
            }
            .padding()
        }
        .navigationTitle("Set Goals")
    }
}
