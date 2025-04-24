//
//  ActivityGrid.swift
//  Banking_Clone
//
//  Created by Firoj-iOS-Developer on 24/04/25.
//

import SwiftUI

struct ActivityGrid: View {
    var gridItems: [HomeScreenGridItems]
    var didTapOnItem: ((HomeScreenGridItems) -> Void)? = nil
    var body: some View {
        LazyVGrid(columns: [GridItem(.fixed(115), spacing: 10),
                            GridItem(.fixed(115), spacing: 10),
                            GridItem(.fixed(115), spacing: 10)]) {
            ForEach(gridItems, id: \.self) { item in
                ActivityCell(text: item.text, imageName: item.iconName)
                    .onTapGesture {
                        self.didTapOnItem?(item)
                    }
            }
        }
    }
}

#Preview {
    ActivityGrid(gridItems: HomeScreenGridItems.allCases)
}
