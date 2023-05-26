//
//  ErrorSheetView.swift
//  BaseMVVMSwiftUI
//
//  Created by Junior Margalho on 25/05/23.
//

import SwiftUI

struct ErrorSheetView: View {
    @Binding var isShown: Bool
    var title: String = "Atenção!"
    var description: String
    var didDisapear: (() -> Void)?
    
    var body: some View {
        HalfModalView(isShown: $isShown, modalHeight: 300) {
            VStack(spacing: 0) {
                HStack {
                    Spacer()
                    Button(action: {
                        isShown.toggle()
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 20, weight: .regular))
                            .foregroundColor(.black)
                    })
                }
                .padding(.top, 20)
                .padding(.trailing, 20)
                VStack(spacing: 4) {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .resizable()
                        .foregroundColor(.orange)
                        .frame(width: 30, height: 30)
                        .padding(.bottom, 12)
                    Text(title)
                        .font(Font.system(size: 22, weight: .bold))
                        .foregroundColor(.black)
                        .padding(.bottom, 12)
                    ScrollView {
                        Text(description)
                            .font(Font.system(size: 16, weight: .medium))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                    }
                    BMButtonView(title: "Fechar") {
                        isShown.toggle()
                        didDisapear?()
                    }
                }
            }
        }
    }
}

struct ErrorSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorSheetView(isShown: .constant(true),
                       description: "O Erro esta entre a mesa e a cadeira!")
    }
}
