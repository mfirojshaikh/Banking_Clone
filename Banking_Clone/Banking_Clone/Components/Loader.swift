//
//  Loader.swift
//  Banking_Clone
//
//  Created by Firoj-iOS-Developer on 15/04/25.
//

import SwiftUI

struct Loader<Content>: View where Content: View {
    var showLoader: Bool
    var content: () -> Content

    var body: some View {
        ZStack {
            content()
                .blur(radius: showLoader ? 2 : 0)
            if showLoader {
                ProgressView()
                    .progressViewStyle(.circular)
                    .scaleEffect(2.5)
                    .tint(.white)
                    .frame(width: 160, height: 160)
                    .background(Color.black.opacity(0.5))
                    .cornerRadius(20)
                    .opacity(0.7)
            }
        }
    }
}
