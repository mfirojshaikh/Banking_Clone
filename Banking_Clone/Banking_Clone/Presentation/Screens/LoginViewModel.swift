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
    @Published var errorMessage: String = ""
    var loginUsecase: LoginUseCaseProtocol = LoginUsecase(provider: LoginProvider())
    
    func didTapLoginButton(email: String, password: String) async -> Bool {
        isLoading = true
        do {
            let result = try await loginUsecase.userDidLogin(email: email, password: password)
            self.isLoading = false
            self.authToken = result.token
            return true
        } catch let error as DomainError {
            self.isLoading = false
            switch error {
            case .unauthorized(let message),
                    .internalError(let message),
                    .parsingError(let message),
                    .unknown(let message):
                errorMessage = message
            default:
                errorMessage = "Something went wrong"
            }
            return false
        } catch {
            self.isLoading = false
            errorMessage = "Something went wrong";
            return false
        }
    }
}
