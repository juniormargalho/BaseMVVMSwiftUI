//
//  SessionManager.swift
//  BaseMVVMSwiftUI
//
//  Created by Junior Margalho on 19/05/23.
//

import Foundation

final class SessionManager {
    static let shared = SessionManager()
    
    enum KeysGeneral: String {
        case token = "keyGeneralToken"
        case hasSession = "keyGeneralHasSession"
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
    
    var hasSession: Bool {
        set {
            UserDefaults.standard.set(newValue, forKey: KeysGeneral.hasSession.rawValue)
        }
        get {
            UserDefaults.standard.bool(forKey: KeysGeneral.hasSession.rawValue)
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
        token = UUID().uuidString
        hasSession = true
        if let userName: String = model.userName {
            self.userName = userName
        }
    }
    
    func endSession() {
        hasSession = false
        UserDefaults.standard.removeObject(forKey: KeysGeneral.token.rawValue)
        UserDefaults.standard.removeObject(forKey: KeysUser.userName.rawValue)
    }
}
