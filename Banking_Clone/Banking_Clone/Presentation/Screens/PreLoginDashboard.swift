//
//  PreLoginDashboard.swift
//  Banking_Clone
//
//  Created by Firoj-iOS-Developer on 15/04/25.
//

import SwiftUI

enum Screens: Int {
    case dahsboard, profile, transactions, settings
}

class Router: ObservableObject {
    @Published var routes: [Screens] = []
    @Published var isUserLogin: Bool = false
}

struct PreLoginDashboard: View {
    @State var selectedTab: Int = 1
    @StateObject var postLoginRouter = Router()
    
    var body: some View {
        NavigationStack {
            if postLoginRouter.isUserLogin {
                PostLoginDashboard()
                    .environmentObject(postLoginRouter)
                    .navigationDestination(for: Screens.self) { screen in
                        switch screen {
                        case .dahsboard:
                            PostLoginDashboard()
                        default:
                            Text("Default Screen")
                        }
                    }
            } else {
                TabView(selection: $selectedTab) {
                    LoginScreen(viewModel: LoginViewModel())
                    .tabItem {
                        Image(systemName: "house.circle")
                    }.tag(1)
                    
                    Text("Tab Content 2")
                    .tabItem {
                        Text("Tab Label 2")
                    }.tag(2)
                }
                .environmentObject(postLoginRouter)
                .background(Color.white)
            }
        }
    }
}

#Preview {
    PreLoginDashboard()
}
