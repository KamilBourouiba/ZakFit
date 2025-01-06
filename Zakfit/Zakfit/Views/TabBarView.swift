//
//  TabBarView.swift
//  Zakfit
//
//  Created by Apprenant 122 on 1/5/25.
//
import SwiftUI

struct TabBarView: View {
    @ObservedObject var viewModel: AppViewModel

    var body: some View {
        TabView {
            DashboardView(viewModel: viewModel)
                .tabItem {
                    Label("Dashboard", systemImage: "chart.bar.xaxis")
                }

            AddMealView(viewModel: viewModel)
                .tabItem {
                    Label("Meals", systemImage: "fork.knife")
                }

            AddActivityView(viewModel: viewModel)
                .tabItem {
                    Label("Activities", systemImage: "figure.walk")
                }

            SetGoalsView(viewModel: viewModel)
                .tabItem {
                    Label("Goals", systemImage: "target")
                }
        }
    }
}
