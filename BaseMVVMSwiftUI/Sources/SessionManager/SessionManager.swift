//
//  SessionManager.swift
//  BaseMVVMSwiftUI
//
//  Created by Junior Margalho on 19/05/23.
//

import Foundation

final class SessionManager: ObservableObject {
    static let shared = SessionManager()
    @Published var state: SessionState = .init()

    func startSession(with model: SessionModel) {
        if let userName: String = model.userName {
            state.userName = userName
        }
        state.token = UUID().uuidString
        state.hasSession = true
    }
    
    func endSession() {
        UserDefaults.standard.removeObject(forKey: KeysGeneral.token.rawValue)
        UserDefaults.standard.removeObject(forKey: KeysUser.userName.rawValue)
        state.hasSession = false
    }
}
