//
//  NetworkError.swift
//  Banking_Clone
//
//  Created by Firoj-iOS-Developer on 25/04/25.
//

enum DataErrors: Error {
    case noInternet
    case invalidURL
    case decodingFailed
    case unknown
    case unauthorized
    case internalError
    case notFound
}
