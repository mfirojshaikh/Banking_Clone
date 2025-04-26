//
//  LoginProvider.swift
//  Banking_Clone
//
//  Created by Firoj-iOS-Developer on 25/04/25.
//
import Foundation

class LoginProvider: LoginProviderProtocol {
    func login(email: String, password: String) async throws -> LoginDomainModal {
        let service = ServiceProvider.shared
        service.configure(endpoint: "login")
        service.request?.httpMethod = "POST"
        let requestEntity: LoginRequestEntity = .init(email: email, password: password)
        if let data = try? JSONEncoder().encode(requestEntity),
           let jsonString = String(data: data, encoding: .utf8) {
            print("Request Body JSON:\n\(jsonString)")
            service.request?.httpBody = data
        }
        do {
            let (data, response) = try await service.execute()
            guard let httpResponse = response as? HTTPURLResponse else {
                throw DomainError.unknown(message: "Something went wrong")
            }

            switch httpResponse.statusCode {
            case 200..<300:
                let entity = try JSONDecoder().decode(LoginResponseEntity.self, from: data)
                return LoginDomainModal(message: entity.message,
                                        user: entity.user.name,
                                        email: entity.user.email,
                                        token: entity.token)

            case 401:
                let errorMessage = try? JSONDecoder().decode(APIErrorResponse.self, from: data).error
                throw DomainError.unauthorized(message: errorMessage ?? "Unauthorized")

            default:
                let errorMessage = try? JSONDecoder().decode(APIErrorResponse.self, from: data).error
                throw DomainError.unknown(message: errorMessage ?? "Something went wrong")
            }

        } catch _ as DecodingError {
            throw DomainError.parsingError(message: "Invalid Respose Data")
        } catch {
            throw error
        }
    }
}
