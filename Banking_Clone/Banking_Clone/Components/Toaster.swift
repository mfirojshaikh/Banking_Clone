//
//  Toaster.swift
//  Banking_Clone
//
//  Created by Firoj-iOS-Developer on 25/04/25.
//

import SwiftUI

struct Toaster: ViewModifier {
    @Binding var isPresented: Bool
    let message: String
    let timer: TimeInterval
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if isPresented {
                VStack {
                    Spacer()
                    HStack {
                        Image(systemName: "network.slash")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundColor(.red)
                            .padding(.leading, 16)
                        Text(message)
                            .font(.body)
                            .foregroundColor(.white)
                            .padding()
                    }
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(8)
                    .shadow(radius: 5)
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
                        isPresented = false
                    })
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}

extension View {
    public func toaster(isPresented: Binding<Bool>, message: String, timer: TimeInterval = 2) -> some View {
        modifier(Toaster(isPresented: isPresented, message: message, timer: timer))
    }
}
