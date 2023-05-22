//
//  HomeView.swift
//  BaseMVVMSwiftUI
//
//  Created by Junior Margalho on 19/05/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var sessionManager: SessionManager
    @StateObject var viewModel: HomeViewModel = .init()
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("Bem vindo, \(sessionManager.session?.userName ?? "")")
                Spacer()
                Button {
                    sessionManager.endSession()
                } label: {
                    Text("Sair")
                        .font(Font.system(size: 12))
                        .foregroundColor(.red)
                }
            }
            .padding(.top, 20)
            Spacer()
        }
        .padding([.leading, .trailing], 20)
        .navigationTitle("HOME")
        .onAppear(perform: {
            viewModel.fetchHome()
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
