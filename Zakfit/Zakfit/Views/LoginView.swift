//
//  LoginView.swift
//  Zakfit
//
//  Created by Apprenant 122 on 1/5/25.
//
import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: AppViewModel
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var loginFailed: Bool = false

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Login") {
                loginFailed = !viewModel.login(email: email, password: password)
            }
            .padding()

            if loginFailed {
                Text("Login failed. Please check your credentials.")
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .navigationTitle("Login")
    }
}
