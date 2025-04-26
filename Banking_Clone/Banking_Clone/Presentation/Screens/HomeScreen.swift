//
//  HomeScreen.swift
//  Banking_Clone
//
//  Created by Firoj-iOS-Developer on 16/04/25.
//

import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject var router: Router
    @State var isLoading: Bool = false
    var username = "Firoj"
    var viewModel: HomeViewModel = HomeViewModel()

    var body: some View {
        BackgroundImage(imageName: "background") {
            Loader(showLoader: isLoading) {
                VStack {
                    Header(username: username) {
                        print("did tap on humberger menu")
                    } didTapLogoutButton: {
                        Task {
                            isLoading = true
                            try await Task.sleep(nanoseconds: 1_000_000_000 * 5)
                            isLoading = false
                            router.isUserLogin = false
                        }
                    }
                    CardCarousel(viewModel: CardCarouselViewModel(cards: viewModel.cards))
                    HomeGridContainer()
                        .background()
                }
            }
        }
        .onAppear() {
            isLoading = true
            viewModel.viewDidAppear()
        }
    }
}

#Preview {
    HomeScreen()
        .environmentObject(Router())
}
