//
//  LoginView.swift
//  BaseMVVMSwiftUI
//
//  Created by Junior Margalho on 15/05/23.
//

import SwiftUI

// MARK: Body
struct LoginView: View {
    @StateObject var viewModel: LoginViewModel = .init()
    
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
                    VStack(spacing: 0) {
                        HStack(spacing: 0) {
                            Text("Email")
                                .font(Font.system(size: 14, weight: .medium))
                            Spacer()
                        }
                        TextField("Email", text: viewModel.userEmailBinding)
                            .frame(height: 40)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .overlay(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(.black, lineWidth: 1))
                    }
                    .padding([.leading, .trailing], 20)
                    .padding(.top, 40)
                    VStack(spacing: 0) {
                        HStack(spacing: 0) {
                            Text("Senha")
                                .font(Font.system(size: 14, weight: .medium))
                            Spacer()
                        }
                        SecureField("Senha", text: viewModel.userPasswordBinding)
                            .frame(height: 40)
                            .overlay(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(.black, lineWidth: 1))
                    }
                    .padding([.leading, .trailing], 20)
                    .padding(.top, 20)
                    Spacer()
                    Button {
                        viewModel.login()
                    } label: {
                        labelButtonContinue
                    }
                    .padding([.leading, .trailing], 20)
                    .disabled(viewModel.isDisabledButton())
                } else {
                    LoadingView()
                }
            }
            .navigationBarHidden(true)
            .alert(isPresented: viewModel.hasErrorBinding) {
                Alert(title: Text("Erro!"),
                      message: Text(viewModel.state.errorMessage)
                )
            }
        }
    }
}

// MARK: Extension
extension LoginView {
    private var labelButtonContinue: some View {
        Text("Continuar")
            .font(Font.system(size: 16, weight: .bold))
            .foregroundColor(.white)
            .frame(height: 40)
            .frame(maxWidth: .infinity)
            .background(viewModel.isDisabledButton() ? Color.gray : Color.black)
            .cornerRadius(4)
    }
}

// MARK: Preview
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
