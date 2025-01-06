//
//  AddActivityView.swift
//  Zakfit
//
//  Created by Apprenant 122 on 1/5/25.
//
import SwiftUI

struct AddActivityView: View {
    @ObservedObject var viewModel: AppViewModel
    @State private var type: String = ""
    @State private var duration: String = ""
    @State private var caloriesBurned: String = ""

    var body: some View {
        VStack {
            TextField("Activity Type", text: $type)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Duration (minutes)", text: $duration)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .padding()

            TextField("Calories Burned", text: $caloriesBurned)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .padding()

            Button("Save Activity") {
                if let dur = Int(duration), let cal = Int(caloriesBurned) {
                    let activity = Activity(type: type, duration: dur, caloriesBurned: cal)
                    viewModel.logActivity(activity: activity)
                    type = ""
                    duration = ""
                    caloriesBurned = ""
                }
            }
            .padding()
        }
        .navigationTitle("Add Activity")
    }
}
