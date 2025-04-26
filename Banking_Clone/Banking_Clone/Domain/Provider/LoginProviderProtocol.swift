//
//  LoginProviderProtocol.swift
//  Banking_Clone
//
//  Created by Firoj-iOS-Developer on 25/04/25.
//

protocol LoginProviderProtocol {
    func login(email: String, password: String) async throws -> LoginDomainModal
}
