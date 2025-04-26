//
//  HomeViewModel.swift
//  Banking_Clone
//
//  Created by Firoj-iOS-Developer on 24/04/25.
//
import Combine

class HomeViewModel: ObservableObject {
    @Published var cards: [CardViewModel] = []
    
    func viewDidAppear() {
        cards = []
    }
}
