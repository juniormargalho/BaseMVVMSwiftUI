//
//  LoginView.swift
//  BaseMVVMSwiftUI
//
//  Created by Junior Margalho on 15/05/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel = .init()
    @State private var isGoToForgotPassword = false
    @State private var isGoToSignup = false
    @State private var textErrorPassword: String = ""
    @State private var textErrorEmail: String = ""
    
    // MARK: Body
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                if !viewModel.state.isLoading {
                    Image(systemName: "photo.on.rectangle.fill")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .padding(.top, 40)
                    Text("Acessar conta")
                        .font(Font.system(size: 24, weight: .medium))
                        .padding(.top, 40)
                    BMTextFieldView(textTitle: "Email",
                                    text: viewModel.userEmailBinding,
                                    textError: textErrorEmail)
                    .padding(.top, 40)
                    BMSecureTextFIeldView(textTitle: "Senha",
                                          text: viewModel.userPasswordBinding,
                                          textError: textErrorPassword)
                    HStack(spacing: 0) {
                        Spacer()
                        Button {
                            isGoToForgotPassword.toggle()
                        } label: {
                            Text("Esqueci minha senha")
                                .font(Font.system(size: 12, weight: .medium))
                                .foregroundColor(.black)
                        }
                    }
                    Spacer()
                    HStack(spacing: 0) {
                        Text("Não tem uma conta? ")
                            .font(Font.system(size: 12, weight: .medium))
                            .foregroundColor(.black)
                        Button {
                            isGoToSignup.toggle()
                        } label: {
                            Text("Inscreva-se")
                                .font(Font.system(size: 12, weight: .medium))
                                .foregroundColor(.blue)
                        }
                    }
                    .padding(.bottom, 12)
                    BMButtonView(title: "Continuar",
                                 isDisabled: viewModel.isDisabledButton()) {
                        viewModel.login()
                    }
                } else {
                    LoadingView()
                }
            }
            .padding(.horizontal, 20)
            .navigationBarHidden(true)
            .alert(isPresented: viewModel.hasErrorBinding) {
                Alert(title: Text("Erro!"),
                      message: Text(viewModel.state.errorMessage)
                )
            }

            NavigationLink(
                destination: ForgotPasswordViewControllerRepresentable(),
                isActive: $isGoToForgotPassword) {}
            
            NavigationLink(
                destination: SignupView(),
                isActive: $isGoToSignup) {}
        }
    }
}

// MARK: Preview
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
