//
//  Segment.swift
//  Banking_Clone
//
//  Created by Firoj-iOS-Developer on 24/04/25.
//

import SwiftUI

struct Segment: View {
    var buttonTitles: [String]
    var didTapOnButton: (Int) -> Void = { _ in }
    @State var selectedIndex: Int = 0
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<buttonTitles.count, id: \.self) { index in
                Button {
                    selectedIndex = index
                    didTapOnButton(index)
                } label: {
                    Text(buttonTitles[index].localized())
                        .foregroundColor(Color.white)
                        .padding(.vertical, 8)
                        .frame(maxWidth: .infinity)
                        .background(index == selectedIndex ? .indigo : Color.gray.opacity(0.6))
                }
                .frame(maxWidth: .infinity)
                .shadow(radius: 5)
                if index != buttonTitles.count - 1 {
                    Divider()
                        .padding(.vertical, 1)
                }
            }
        }
        .background(Color.gray)
        .padding()
        .frame(maxHeight: 70)
        .shadow(radius: 2)
    }
}

#Preview {
    Segment(buttonTitles: ["top_activity", "_discover", "_profile"])
}
