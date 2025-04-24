//
//  BackgroundImage.swift
//  Banking_Clone
//
//  Created by Firoj-iOS-Developer on 15/04/25.
//

import SwiftUI

struct BackgroundImage<Content>: View where Content: View {
    var imageName: String = "background"
    var content: () -> Content
    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .edgesIgnoringSafeArea(.all)
            content()
        }
    }
}
