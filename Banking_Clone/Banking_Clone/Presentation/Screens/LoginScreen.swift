//
//  LoginScreen.swift
//  Banking_Clone
//
//  Created by Firoj-iOS-Developer on 14/04/25.
//

import SwiftUI

struct LoginScreen: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var email: String = "demo@gmail.com"
    @State var isEditingEmail: Bool = false
    @StateObject var viewModel: LoginViewModel
    @EnvironmentObject var router: Router

    var body: some View {
        NavigationView {
            Loader(showLoader: viewModel.isLoading) {
                BackgroundImage {
                    VStack(spacing: 16) {
                        Image("profile_placeholder")
                            .resizable()
                            .frame(width: 150, height: 160)
                            .padding()
                        EmailAddressField(isEditingEmail: $isEditingEmail, email: $email)
                        PasswordField { password in
                            Task {
                                await viewModel.didTapLoginButton(email: email, password: password)
                                router.isUserLogin = true
                                print("after API call")
                                router.routes.append(.dahsboard)
                            }
                        }
                        Spacer()
                    }
                    .frame(width: 400, height: 500)
                    .onTapGesture {
                        isEditingEmail = false
                    }
                }
            }
        }
    }
}

#Preview {
    LoginScreen(viewModel: LoginViewModel())
}
