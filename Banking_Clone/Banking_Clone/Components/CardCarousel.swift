//
//  CardCarousel.swift
//  Banking_Clone
//
//  Created by Firoj-iOS-Developer on 23/04/25.
//

import SwiftUI

struct CardCarouselViewModel {
    let cards: [CardViewModel]
    
    static func sample() -> CardCarouselViewModel {
        let card = CardViewModel(id: 1234567890,
                                 accountType: "Saving account",
                                 accountNumber: "1234567890",
                                 accountBalance: "$ 12345678")
        let card2 = CardViewModel(id: 1234567891,
                                  accountType: "Saving account",
                                  accountNumber: "1234567891",
                                  accountBalance: "$ 12345678")
        let card3 = CardViewModel(id: 1234567890,
                                  accountType: "Saving account",
                                  accountNumber: "1234567892",
                                  accountBalance: "$ 12345678")
        return CardCarouselViewModel(cards: [card, card2, card3])
    }
}

struct CardCarousel: View {
    var viewModel: CardCarouselViewModel
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(viewModel.cards) { arrayElement in
                    CardView(viewModel: arrayElement)
                }
            }
        }
    }
}

#Preview {
    
    CardCarousel(viewModel: CardCarouselViewModel.sample())
}
