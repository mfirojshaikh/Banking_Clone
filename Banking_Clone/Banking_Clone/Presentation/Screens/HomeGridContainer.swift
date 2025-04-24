//
//  HomeGridContainer.swift
//  Banking_Clone
//
//  Created by Firoj-iOS-Developer on 24/04/25.
//

import SwiftUI

struct HomeGridContainer: View {
    @State var selectedSegmentIndex: Int = 0

    var body: some View {
        VStack(spacing: 0) {
            Segment(buttonTitles: ["top_activity", "_discover"]) { index in
                selectedSegmentIndex = index
            }
            ScrollView(.vertical, showsIndicators: false) {
                if selectedSegmentIndex == 0 {
                    ActivityGrid(gridItems: HomeScreenGridItems.allCases) { item in
                        print("did tap on \(item)")
                    }
                } else {
                    DiscoverList()
                        .padding(.horizontal, 8)
                }
            }
        }
    }
}

#Preview {
    HomeGridContainer()
}
