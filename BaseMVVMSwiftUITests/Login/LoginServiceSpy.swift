//
//  LoginServiceSpy.swift
//  BaseMVVMSwiftUITests
//
//  Created by Junior Margalho on 16/05/23.
//

import BaseMVVMSwiftUI
import Foundation

final class LoginServiceSpy: LoginServiceProtocol {
    var performRequestCount: Int = 0
    var performRequestCalled: Bool = false
    var modelToBeReturned: LoginResponseModel?
    
    func postLogin(model: LoginRequestModel,
                   completion: @escaping (Result<LoginResponseModel, Error>) -> Void) {
        performRequestCount += 1
        performRequestCalled = true
        
        if let model = modelToBeReturned {
            completion(.success(model))
        } else {
            completion(.failure(NSError()))
        }
    }
}
