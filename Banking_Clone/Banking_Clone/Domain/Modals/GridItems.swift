//
//  GridItems.swift
//  Banking_Clone
//
//  Created by Firoj-iOS-Developer on 24/04/25.
//

enum HomeScreenGridItems: CaseIterable {
    case fundTransfer
    case payBill
    case recharge
    case cards
    case accountsAndDeposits
    case investAndInsure
    case loans
    case updateAadhaar
    case onlinePPF
    
    var text: String {
        switch self {
        case .fundTransfer:
            return "fund_transfer"
        case .payBill:
            return "bill_pay"
        case .accountsAndDeposits:
            return "accounts_and_deposit"
        case .cards:
            return "_cards"
        case .investAndInsure:
            return "invest_and_insure"
        case .loans:
            return "_loans"
        case .onlinePPF:
            return "online_ppf"
        case .updateAadhaar:
            return "update_aadhaar"
        case .recharge:
            return "_recharge"
        }
    }
    
    var iconName: String {
        switch self {
        case .fundTransfer:
            return "arrow.right.arrow.left.circle"
        case .payBill:
            return "indianrupeesign.circle"
        case .accountsAndDeposits:
            return "iphone.gen3.crop.circle"
        case .cards:
            return "creditcard.fill"
        case .investAndInsure:
            return "arrow.right.arrow.left.circle"
        case .loans:
            return "arrow.right.arrow.left.circle"
        case .onlinePPF:
            return "arrow.right.arrow.left.circle"
        case .updateAadhaar:
            return "arrow.right.arrow.left.circle"
        case .recharge:
            return "arrow.right.arrow.left.circle"
        }
    }
}
