//
//  PasswordField.swift
//  Banking_Clone
//
//  Created by Firoj-iOS-Developer on 15/04/25.
//
import SwiftUI

struct PasswordField: View {
    enum Field: Hashable {
        case digit1, digit2, digit3, digit4
    }

    @State private var codeNumber1: String = ""
    @State private var codeNumber2: String = ""
    @State private var codeNumber3: String = ""
    @State private var codeNumber4: String = ""
    @FocusState private var isFocused: Field?
    var completion: (String) -> Void
    
    var body: some View {
        return HStack(spacing: 20) {
            getPassCode(text: $codeNumber1, currentField: .digit1, nextField: .digit2)
            getPassCode(text: $codeNumber2, currentField: .digit2, nextField: .digit3, preField: .digit1)
            getPassCode(text: $codeNumber3, currentField: .digit3, nextField: .digit4, preField: .digit2)
            getPassCode(text: $codeNumber4, currentField: .digit4, preField: .digit3)
        }
        .frame(width: 300, height: 70)
        .onAppear() {
            isFocused = .digit1
            codeNumber1 = ""
            codeNumber2 = ""
            codeNumber3 = ""
            codeNumber4 = ""
        }
    }

    func getPassCode(text: Binding<String>, currentField: Field, nextField: Field? = nil, preField: Field? = nil) -> some View {
        return SecureField("", text: text)
            .fontWidth(.expanded)
            .frame(width: 50, height: 50)
            .background(Color.gray)
            .cornerRadius(25)
            .multilineTextAlignment(.center)
            .focused($isFocused, equals: currentField)
            .keyboardType(.numberPad)
            .shadow(color: .black.opacity(0.2), radius: 0, x: 2, y: 4)
            .onChange(of: text.wrappedValue, { oldValue, newValue in
                if newValue.count >= 1 {
                    text.wrappedValue = newValue.prefix(1).description
                    isFocused = nextField
                }
                if newValue.isEmpty {
                    isFocused = preField
                } else if nextField == nil {
                    completion(codeNumber1 + codeNumber2 + codeNumber3 + codeNumber4)
                }
            })
    }
}
