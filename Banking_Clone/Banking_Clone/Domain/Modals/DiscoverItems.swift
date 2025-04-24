//
//  DiscoverItems.swift
//  Banking_Clone
//
//  Created by Firoj-iOS-Developer on 24/04/25.
//

enum DiscoverItems: CaseIterable {
    case amazon
    case flipkart
    case airbnb
    case netflix
    case spotify
    case apple
    
    var text: String {
        switch self {
        case .amazon:
            return "Amazon"
        case .flipkart:
            return "Flipkart"
        case .airbnb:
            return "Airbnb"
        case .netflix:
            return "Netflix"
        case .spotify:
            return "Spotify"
        case .apple:
            return "Apple"
        }
    }
}
