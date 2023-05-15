//
//  LoginViewModel.swift
//  BaseMVVMSwiftUI
//
//  Created by Junior Margalho on 15/05/23.
//

import Foundation

struct LoginViewState {
    var isLoading = false
    var hasError = false
    var errorMessage = ""
    var userEmail = ""
    var userName = ""
    var userAvatar = ""
}

@MainActor class LoginViewModel: ObservableObject {
    @Published private(set) var state: LoginViewState
    private let service: LoginService
    
    init(state: LoginViewState, service: LoginService) {
        self.state = state
        self.service = service
    }
    
    func login(model: LoginRequestModel) {
        state.isLoading = true
        service.postLogin(model: model) { [weak self] result in
            switch result {
            case .success(let model):
                self?.state.isLoading = false
                self?.state.userEmail = model.userEmail
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
}
