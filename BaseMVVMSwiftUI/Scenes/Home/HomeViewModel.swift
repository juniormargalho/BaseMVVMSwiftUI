//
//  HomeViewModel.swift
//  BaseMVVMSwiftUI
//
//  Created by Junior Margalho on 19/05/23.
//

import Foundation

struct HomeViewState {
    var userName = ""
}

final class HomeViewModel: ObservableObject {
    @Published private(set) var state: HomeViewState
    
    init(state: HomeViewState = .init()) {
        self.state = state
    }
    
    func fetchHome() {
        if let userName = SessionManager.shared.userName {
            state.userName = userName
        }
    }
}
