//
//  DomainError.swift
//  Banking_Clone
//
//  Created by Firoj-iOS-Developer on 25/04/25.
//

enum DomainError: Error {
    case invalidInput
    case internalError(message: String)
    case notFound
    case unauthorized(message: String)
    case parsingError(message: String)
    case unknown(message: String)
    
    func localizedDescription() -> String {
        switch self {
        case .invalidInput:
            return "Invalid input"
        case .internalError:
            return "Internal server error"
        case .notFound:
            return "Page Not found"
        case .unauthorized:
            return "Unauthorized"
        case .parsingError:
            return "Parsing error"
        case .unknown:
            return "Unknown error"
        }
    }
}
