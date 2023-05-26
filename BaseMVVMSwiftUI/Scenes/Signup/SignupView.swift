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
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 8) {
                BMTextFieldView(textTitle: "Nome",
                                text: viewModel.userNameBinding,
                                textError: viewModel.state.textErrorName)
                BMTextFieldView(textTitle: "Telefone",
                                text: viewModel.userPhoneBinding,
                                textError: viewModel.state.textErrorPhone,
                                keyboardType: .decimalPad)
            }
            .padding(.top, 40)
            Spacer()
            BMButtonView(title: "Continuar",
                         isDisabled: viewModel.isDisabledButton()) {
                
            }
        }
        .padding(.horizontal, 20)
        .navigationTitle("Inscreva-se")
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
