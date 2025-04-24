//
//  LoginViewModel.swift
//  Banking_Clone
//
//  Created by Firoj-iOS-Developer on 14/04/25.
//
import Combine
import Foundation

@MainActor
class LoginViewModel: ObservableObject {
    @Published var authToken: String = ""
    @Published var isLoading: Bool = false
    
    func didTapLoginButton(email: String, password: String) async {
        isLoading = true
        do {
            try await Task.sleep(nanoseconds: 5 * 1_000_000_000)
            print("Login Successfully")
            self.isLoading = false
            self.authToken = "token"
        } catch {
            print("error - \(error)")
        }
    }
}
