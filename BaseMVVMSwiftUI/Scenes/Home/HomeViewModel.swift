//
//  HomeViewModel.swift
//  BaseMVVMSwiftUI
//
//  Created by Junior Margalho on 19/05/23.
//

import Foundation

struct HomeViewState {
}

final class HomeViewModel: ObservableObject {
    @Published private(set) var state: HomeViewState
    
    init(state: HomeViewState = .init()) {
        self.state = state
    }
    
    func fetchHome() {
    }
}
