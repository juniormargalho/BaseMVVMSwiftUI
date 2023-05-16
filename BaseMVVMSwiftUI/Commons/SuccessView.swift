//
//  SuccessView.swift
//  BaseMVVMSwiftUI
//
//  Created by Junior Margalho on 16/05/23.
//

import SwiftUI

struct SuccessView: View {
    var title: String
    var subTitle: String
    
    var body: some View {
        VStack(spacing: 0) {
            Text(title)
                .font(Font.system(size: 30, weight: .medium))
                .foregroundColor(.white)
                .padding(.top, 60)
            Text(subTitle)
                .font(Font.system(size: 16, weight: .medium))
                .foregroundColor(.white)
                .padding(.top, 40)
            Spacer()
            Button {
                NavigationUtil.popToRootView()
            } label: {
                labelButtonClose
            }
        }
        .padding([.leading, .trailing], 20)
        .background(Color.black)
        .navigationBarHidden(true)
    }
}

// MARK: Estension
extension SuccessView {
    private var labelButtonClose: some View {
        Text("Fechar")
            .font(Font.system(size: 16, weight: .medium))
            .foregroundColor(.white)
            .frame(height: 40)
            .frame(maxWidth: .infinity)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(.white, lineWidth: 1))
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView(title: "Sucesso",
                    subTitle: "A tarefa foi concluida com sucesso!")
    }
}
