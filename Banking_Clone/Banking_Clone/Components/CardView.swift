//
//  CardView.swift
//  Banking_Clone
//
//  Created by Firoj-iOS-Developer on 16/04/25.
//

import SwiftUI

struct CardViewModel: Identifiable {
    var id: Int    
    let accountType: String
    let accountNumber: String
    let accountBalance: String
    let didTapStatements: (() -> Void)? = nil
    let didTapDeposit: (() -> Void)? = nil
    let didTapManage: (() -> Void)? = nil
}

struct CardView: View {
    var viewModel: CardViewModel
    var body: some View {
        BackgroundImage(imageName: "card_bg") {
            VStack(spacing: 12) {
                HStack {
                    Spacer()
                    Image("icici_logo")
                        .resizable()
                        .frame(width: 120, height: 50)
                        .padding(.horizontal, 24)
                }
                Text("\(viewModel.accountType): 1234567890")
                    .font(.headline)
                Text("account_balance")
                    .font(.title)
                Text("\(viewModel.accountBalance)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(alignment: .center, spacing: 16) {
                    Button("_statements") {
                        viewModel.didTapStatements?()
                    }
                    Divider()
                    Button("_deposit") {
                        viewModel.didTapDeposit?()
                    }
                    Divider()
                    Button("_manage") {
                        viewModel.didTapManage?()
                    }
                }
                .padding()
            }
        }
        .foregroundColor(.white.opacity(0.8))
        .cornerRadius(20)
        .shadow(radius: 5)
        .padding()
        .frame(width: 370, height: 240)
    }
}

#Preview {
    CardView(viewModel: CardViewModel(id: 1234567890,
                                      accountType: "Saving account",
                                      accountNumber: "1234567890",
                                      accountBalance: "$ 12345678"))
}
