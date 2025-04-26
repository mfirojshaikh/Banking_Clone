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
    @State private var email: String = "user@example.com"
    @State var isEditingEmail: Bool = false
    @State var showToastError: Bool = false
    @State var wipePassword: Bool = false
    @StateObject var viewModel: LoginViewModel
    @EnvironmentObject var router: Router

    var body: some View {
        NavigationView {
            Loader(showLoader: viewModel.isLoading) {
                BackgroundImage {
                    VStack(spacing: 16) {
                        profileImage
                        EmailAddressField(isEditingEmail: $isEditingEmail, email: $email)
                        PasswordField(wipePassword: $wipePassword) { password in
                            passwordFieldDidChange(password)
                        }
                        Spacer()
                    }
                    .frame(width: 400, height: 500)
                    .onTapGesture {
                        isEditingEmail = false
                    }
                }
                .toaster(isPresented: $showToastError, message: viewModel.errorMessage, timer: 2.0)
            }
        }
    }
    
    var profileImage: some View {
        Image("profile_placeholder")
            .resizable()
            .frame(width: 150, height: 160)
            .padding()
    }
    
    func passwordFieldDidChange(_ password: String) {
        self.password = password
        Task {
            let isLoginSuccess = await viewModel.didTapLoginButton(email: email, password: password)
            wipePassword = true
            if isLoginSuccess {
                router.isUserLogin = true
                router.routes.append(.dahsboard)
            } else {
                withAnimation {
                    showToastError = true
                }
            }
        }
    }
}

#Preview {
    LoginScreen(viewModel: LoginViewModel())
}
