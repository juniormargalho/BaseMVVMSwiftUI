//
//  LoginViewModel.swift
//  BaseMVVMSwiftUI
//
//  Created by Junior Margalho on 15/05/23.
//

import SwiftUI

struct LoginViewState {
    var isLoading = false
    var hasError = false
    var errorMessage = ""
    var userEmail = ""
    var userPassword = ""
    var userName = ""
    var userAvatar = ""
}

@MainActor class LoginViewModel: ObservableObject {
    @Published private(set) var state: LoginViewState
    private let service: LoginService
    
    var userEmailBinding: Binding<String> {
        Binding(get: { self.state.userEmail },
                set: { self.state.userEmail = $0 })
    }
    
    var userPasswordBinding: Binding<String> {
        Binding(get: { self.state.userPassword },
                set: { self.state.userPassword = $0 })
    }
    
    var hasErrorBinding: Binding<Bool> {
        Binding(get: { self.state.hasError },
                set: { self.state.hasError = $0 })
    }
    
    init(state: LoginViewState = .init(), service: LoginService = .init()) {
        self.state = state
        self.service = service
    }
    
    func login() {
        state.isLoading = true
        let model = LoginRequestModel(email: state.userEmail,
                                      password: state.userPassword)
        service.postLogin(model: model) { [weak self] result in
            switch result {
            case .success(let model):
                self?.state.isLoading = false
                self?.state.userName = model.userName
                if let avatar = model.userAvatar {
                    self?.state.userAvatar = avatar
                }
            case .failure(_):
                self?.state.isLoading = false
                self?.state.hasError = true
                self?.state.errorMessage = "Email ou senhas incorretos!"
            }
        }
    }
    
    func isDisabledButton() -> Bool {
        return state.userPassword.isEmpty || state.userPassword.isEmpty
    }
}
