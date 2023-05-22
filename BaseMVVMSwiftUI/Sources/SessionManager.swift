//
//  SessionManager.swift
//  BaseMVVMSwiftUI
//
//  Created by Junior Margalho on 19/05/23.
//

import Foundation

enum KeysGeneral: String {
    case token = "keyGeneralToken"
    case hasSession = "keyGeneralHasSession"
}

enum KeysUser: String {
    case userName = "keyUserName"
}

struct SessionState {
    var hasSession: Bool {
        set {
            UserDefaults.standard.set(newValue, forKey: KeysGeneral.hasSession.rawValue)
        }
        get {
            UserDefaults.standard.bool(forKey: KeysGeneral.hasSession.rawValue)
        }
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
}

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
