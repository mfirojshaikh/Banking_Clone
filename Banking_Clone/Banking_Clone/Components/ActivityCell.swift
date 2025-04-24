//
//  ActivityCell.swift
//  Banking_Clone
//
//  Created by Firoj-iOS-Developer on 24/04/25.
//

import SwiftUI

struct ActivityCell: View {
    let text: String
    let imageName: String
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .resizable()
                .frame(width: 40, height: 30)
            Text("\(text)")
                .frame(width: 90)
                .frame(maxHeight: 60)
                .multilineTextAlignment(.center)
        }
        .padding()
        .background(Color.orange.opacity(0.2))
    }
}

#Preview {
    ActivityCell(text: "text", imageName: "sample")
}
