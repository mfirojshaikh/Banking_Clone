//
//  DiscoverList.swift
//  Banking_Clone
//
//  Created by Firoj-iOS-Developer on 24/04/25.
//

import SwiftUI

struct DiscoverCell: View {
    let text: String
    var body: some View {
        HStack {
            Image(systemName: "lightbulb.min")
                .resizable()
                .tint(Color.blue)
                .frame(width: 32, height: 32)
                .padding()
            VStack(alignment: .leading) {
                Text(text)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                Text("Discover")
                    .font(.caption2)
                Text("4242 4242 4242 4242")
                    .font(.caption)
            }
            Spacer()
        }
        .padding()
        .cornerRadius(8)
        .border(Color.gray.opacity(0.2), width: 2)
    }
}

struct DiscoverList: View {
    var body: some View {
        NavigationStack {
            ForEach(DiscoverItems.allCases, id: \.self) { item in
                NavigationLink(destination: Text(item.text)) {
                    DiscoverCell(text: item.text)
                        .padding(.horizontal, 10)
                }
            }
        }
    }
}

#Preview {
    DiscoverList()
}
