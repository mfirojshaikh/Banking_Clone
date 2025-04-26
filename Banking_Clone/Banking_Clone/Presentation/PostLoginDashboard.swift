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
        tabBarAppearance.backgroundColor = UIColor.secondarySystemBackground.withAlphaComponent(1)
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
                    Text("_home")
                }
            Text("Transactions")
                .tabItem {
                    Image(systemName: "arrowshape.left.arrowshape.right")
                    Text("_transactions")
                }
            Text("Settings")
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("_settings")
                }
            Text("Profile")
                .tabItem {
                    Image(systemName: "person.circle.fill")
                    Text("_profile")
                }
        }
    }
}

#Preview {
    PostLoginDashboard()
        .environmentObject(Router())
}
