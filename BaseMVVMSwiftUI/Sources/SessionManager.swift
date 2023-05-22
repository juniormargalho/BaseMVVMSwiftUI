//
//  SessionManager.swift
//  BaseMVVMSwiftUI
//
//  Created by Junior Margalho on 19/05/23.
//

import Foundation

final class SessionManager: ObservableObject {
    @Published var session: SessionModel?
    static let shared = SessionManager()
    
    enum KeysGeneral: String {
        case token = "keyGeneralToken"
    }
    
    enum KeysUser: String {
        case userName = "keyUserName"
    }
    
    var token: String? {
        set {
            UserDefaults.standard.set(newValue, forKey: KeysGeneral.token.rawValue)
        }
        get {
            UserDefaults.standard.string(forKey: KeysGeneral.token.rawValue)
        }
    }

    var userName: String? {
        set {
            UserDefaults.standard.set(newValue, forKey: KeysUser.userName.rawValue)
        }
        get {
            UserDefaults.standard.string(forKey: KeysUser.userName.rawValue)
        }
    }
    
    func startSession(with model: SessionModel) {
        if let userName: String = model.userName {
            self.userName = userName
        }
        token = UUID().uuidString
        session = model
    }
    
    func endSession() {
        UserDefaults.standard.removeObject(forKey: KeysGeneral.token.rawValue)
        UserDefaults.standard.removeObject(forKey: KeysUser.userName.rawValue)
        session = nil
    }
}
