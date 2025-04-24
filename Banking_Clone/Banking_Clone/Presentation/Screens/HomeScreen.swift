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

    var headerMenus: some View {
        HStack {
            Button(action: {
                print("did tap on humberger menu")
            }) {
                Image(systemName: "line.horizontal.3.circle.fill")
                    .resizable()
                    .frame(width: 32, height: 32)
            }
            .padding()
            Text("welcome_message \(username)")
            Spacer()
            Button(action: {
                Task {
                    isLoading = true
                    try await Task.sleep(nanoseconds: 1_000_000_000 * 5)
                    isLoading = false
                    router.isUserLogin = false
                }
            }) {
                Image(systemName: "lock.rotation.open")
                    .resizable()
                    .frame(width: 32, height: 32)
            }
            .padding()
        }
        .background(Color.white)
        .shadow(radius: 5)
    }

    var body: some View {
        BackgroundImage(imageName: "background") {
            Loader(showLoader: isLoading) {
                VStack {
                    headerMenus
                    CardCarousel(viewModel: CardCarouselViewModel.sample())
                    HomeGridContainer()
                        .background()
                }
            }
        }
        .onAppear() {
            print("recevied router = \(router.routes)")
        }
    }
}

#Preview {
    HomeScreen()
        .environmentObject(Router())
}
