//
//  ServiceProvider.swift
//  Banking_Clone
//
//  Created by Firoj-iOS-Developer on 25/04/25.
//
import Foundation

class ServiceProvider {
    let baseURL: String = "http://localhost:3000/api/"
    static var shared = ServiceProvider()
    var request: URLRequest?
    private init() {}
    
    func configure(endpoint: String) {
        request = URLRequest(url: URL(string: baseURL + endpoint)!)
        request?.setValue("application/json", forHTTPHeaderField: "Content-Type")
    }
    
    func execute() async throws -> (Data, URLResponse) {
        let (data, response) = try await URLSession.shared.data(for: request!)
        print("Reqeust endPoint-\(request?.url?.absoluteString ?? "")")
        print("API Response- \(String(data: data, encoding: .utf8))")
        return (data, response)
    }
}
