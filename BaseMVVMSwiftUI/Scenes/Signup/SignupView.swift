//
//  SignupView.swift
//  BaseMVVMSwiftUI
//
//  Created by Junior Margalho on 25/05/23.
//

import SwiftUI

struct SignupView: View {
    @StateObject var viewModel: SignupViewModel = .init()
    @State private var textErrorName: String = ""
    @State private var username = ""
    @State private var isFocusedPhone: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 8) {
                BMTextFieldView(textTitle: "Nome",
                                text: viewModel.userNameBinding,
                                textError: viewModel.state.textErrorName)
                BMToolbarTextFieldView(textTitle: "Telefone",
                                       text: viewModel.userPhoneBinding,
                                       isFocused: $isFocusedPhone,
                                       keyboardType: .numberPad)
                BMTextFieldView(textTitle: "Email",
                                text: viewModel.userEmailBinding,
                                textError: viewModel.state.textErrorEmail,
                                keyboardType: .emailAddress)
            }
            .padding(.top, 40)
            Spacer()
            BMButtonView(title: "Continuar",
                         isDisabled: viewModel.isDisabledButton()) {
                
            }
            .padding(.bottom, 20)
        }
        .padding(.horizontal, 20)
        .navigationTitle("Inscreva-se")
        .onTapGesture {
            isFocusedPhone = false
            UIApplication.shared.endEditing()
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
