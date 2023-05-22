//
//  LoginService.swift
//  BaseMVVMSwiftUI
//
//  Created by Junior Margalho on 15/05/23.
//

import Foundation

public protocol LoginServiceProtocol {
    func postLogin(model: LoginRequestModel,
                   completion: @escaping (Result<LoginResponseModel, Error>) -> Void)
}

final class LoginService: LoginServiceProtocol {
    func postLogin(model: LoginRequestModel,
                   completion: @escaping (Result<LoginResponseModel, Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if model.email == "email" && model.password == "123" {
                let model = LoginResponseModel(userName: "Usuário")
                completion(.success(model))
            } else {
                completion(.failure(NSError()))
            }
        }
    }
}
