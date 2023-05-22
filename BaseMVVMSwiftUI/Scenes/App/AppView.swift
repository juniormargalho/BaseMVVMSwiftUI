//
//  AppView.swift
//  BaseMVVMSwiftUI
//
//  Created by Junior Margalho on 22/05/23.
//

import SwiftUI

struct AppView: View {
    @EnvironmentObject var sessionManager: SessionManager
    
    var body: some View {
        Group {
            if sessionManager.state.hasSession {
                HomeView()
            } else {
                LoginView()
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
