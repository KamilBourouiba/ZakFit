//
//  ContentView.swift
//  Zakfit
//
//  Created by Apprenant 122 on 1/5/25.
//
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = AppViewModel()

    var body: some View {
        NavigationView {
            if let _ = viewModel.loggedInUser {
                TabBarView(viewModel: viewModel)
            } else {
                LoginView(viewModel: viewModel)
            }
        }
    }
}
