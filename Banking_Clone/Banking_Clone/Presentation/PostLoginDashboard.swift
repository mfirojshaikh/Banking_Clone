//
//  PostLoginDashboard.swift
//  Banking_Clone
//
//  Created by Firoj-iOS-Developer on 16/04/25.
//

import SwiftUI

struct PostLoginDashboard: View {

    init() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        UITabBar.appearance().standardAppearance = tabBarAppearance
        // For iOS 15+, set scrollEdgeAppearance too
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }

    var body: some View {
        TabView {
            HomeScreen()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Text("Transactions")
                .tabItem {
                    Image(systemName: "arrowshape.left.arrowshape.right")
                    Text("Transactions")
                }
            Text("Settings")
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
            Text("Profile")
                .tabItem {
                    Image(systemName: "person.circle.fill")
                    Text("Profile")
                }
        }
    }
}

#Preview {
    PostLoginDashboard()
        .environmentObject(Router())
}
