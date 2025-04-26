//
//  LoginUsecase.swift
//  Banking_Clone
//
//  Created by Firoj-iOS-Developer on 25/04/25.
//

protocol LoginUseCaseProtocol {
    func userDidLogin(email: String, password: String) async throws -> LoginDomainModal
}

class LoginUsecase: LoginUseCaseProtocol {
    var provider: LoginProviderProtocol
    
    init(provider: LoginProviderProtocol) {
        self.provider = provider
    }

    func userDidLogin(email: String, password: String) async throws -> LoginDomainModal {
        try await provider.login(email: email, password: password)
    }
}
