//
//  LoginRequestEntity.swift
//  Banking_Clone
//
//  Created by Firoj-iOS-Developer on 25/04/25.
//

struct LoginRequestEntity: Codable {
    let email: String
    let password: String
}

struct UserEntity: Codable {
    let name: String
    let email: String
}

struct LoginResponseEntity: Codable {
    let message: String
    let user: UserEntity
    let token: String
}
