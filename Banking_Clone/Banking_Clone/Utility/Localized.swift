//
//  Localized.swift
//  Banking_Clone
//
//  Created by Firoj-iOS-Developer on 24/04/25.
//
import Foundation

extension String {
    func localized() -> String {
        NSLocalizedString(self, comment: "")
    }
}
