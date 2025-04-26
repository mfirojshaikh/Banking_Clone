//
//  Header.swift
//  Banking_Clone
//
//  Created by Firoj-iOS-Developer on 24/04/25.
//

import SwiftUI

struct Header: View {
    let username: String
    let didTapMenuButton: () -> Void
    let didTapLogoutButton: () -> Void

    var body: some View {
        HStack {
            Button(action: {
                didTapMenuButton()
            }) {
                Image(systemName: "line.horizontal.3.circle.fill")
                    .resizable()
                    .frame(width: 32, height: 32)
            }
            .padding()
            Text("welcome_message \(username)")
            Spacer()
            Button(action: {
                didTapLogoutButton()
            }) {
                Image(systemName: "lock.rotation.open")
                    .resizable()
                    .frame(width: 32, height: 32)
            }
            .padding()
        }
        .background(Color.white)
        .shadow(radius: 5)
    }
}

#Preview {
    Header(username: "Firoj") {
    } didTapLogoutButton: {
    }
}
