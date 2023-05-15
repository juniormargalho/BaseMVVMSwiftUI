//
//  LoginService.swift
//  BaseMVVMSwiftUI
//
//  Created by Junior Margalho on 15/05/23.
//

import Foundation

final class LoginService {
    func postLogin(model: LoginRequestModel,
                   completion: @escaping (Result<LoginResponseModel, Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if model.email == "user" && model.password == "123456" {
                let model = LoginResponseModel(userName: "Usuário",
                                               userEmail: "usuario@email.com")
                completion(.success(model))
            } else {
                completion(.failure(NSError()))
            }
        }
    }
}

