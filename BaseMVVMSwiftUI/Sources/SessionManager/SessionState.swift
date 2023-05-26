//
//  SessionState.swift
//  BaseMVVMSwiftUI
//
//  Created by Junior Margalho on 26/05/23.
//

import Foundation

struct SessionState {
    var hasSession: Bool {
        set { UserDefaults.standard.set(newValue, forKey: KeysGeneral.hasSession.rawValue) }
        get { UserDefaults.standard.bool(forKey: KeysGeneral.hasSession.rawValue) }
    }
    
    var token: String? {
        set { UserDefaults.standard.set(newValue, forKey: KeysGeneral.token.rawValue) }
        get { UserDefaults.standard.string(forKey: KeysGeneral.token.rawValue) }
    }

    var userName: String? {
        set { UserDefaults.standard.set(newValue, forKey: KeysUser.userName.rawValue) }
        get { UserDefaults.standard.string(forKey: KeysUser.userName.rawValue) }
    }
}
