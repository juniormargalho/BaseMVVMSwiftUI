//
//  SignupViewModel.swift
//  BaseMVVMSwiftUI
//
//  Created by Junior Margalho on 25/05/23.
//

import SwiftUI

struct SignupViewState {
    var userName = ""
    var userPhone = ""
    var textErrorName = ""
    var textErrorPhone = ""
}

final class SignupViewModel: ObservableObject {
    @Published private(set) var state: SignupViewState
    
    var userNameBinding: Binding<String> {
        Binding(get: { self.state.userName },
                set: { self.state.userName = $0 })
    }
    
    var userPhoneBinding: Binding<String> {
        Binding(get: { self.state.userPhone },
                set: { self.state.userPhone = $0 })
    }
    
    init(state: SignupViewState = .init()) {
        self.state = state
    }
    
    func isDisabledButton() -> Bool {
        return false
    }
}
