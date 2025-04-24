//
//  EmailAddressField.swift
//  Banking_Clone
//
//  Created by Firoj-iOS-Developer on 15/04/25.
//
import SwiftUI

struct EmailAddressField: View {
    @Binding var isEditingEmail: Bool
    @Binding var email: String
    @FocusState var isFocused: Bool
    var body: some View {
        HStack {
            if isEditingEmail {
                TextField("Enter your email address", text: $email)
                    .focused($isFocused)
                    .onChange(of: isFocused) { focused in
                        if !focused {
                            isEditingEmail = false
                        }
                    }
                    .onSubmit {
                        isEditingEmail = false
                    }
            } else {
                Text(email)
            }
            Button {
                isFocused = true
                isEditingEmail = true
            } label: {
                Image(systemName: "pencil.circle")
            }
        }
        .font(.title2)
        .padding(12)
        .frame(height: 55)
        .background(Color.gray.opacity(0.3))
        .cornerRadius(20)
    }
}
