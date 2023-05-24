//
//  BMTextFieldView.swift
//  BaseMVVMSwiftUI
//
//  Created by Junior Margalho on 23/05/23.
//

import SwiftUI

struct BMTextFieldView: View {
    var textTitle: String
    @Binding var text: String
    var textError = ""
    var isSecureType = false
    var primaryColor = Color.primary
    var secondaryColor = Color.secondary
    @State private var isSecureTextEntry: Bool = false
    
    var body: some View {
        VStack(spacing: 2) {
            HStack {
                Text(textTitle)
                    .font(Font.system(size: 16))
                    .foregroundColor(primaryColor)
                Spacer()
            }
            HStack {
                if isSecureTextEntry {
                    SecureField(textTitle, text: $text)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .accentColor(primaryColor)
                } else {
                    TextField(textTitle, text: $text)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .accentColor(primaryColor)
                }
                if isSecureType {
                    Button(action: {
                        isSecureTextEntry.toggle()
                    }) {
                        Image(systemName: isSecureTextEntry ? "eye.slash" : "eye")
                    }
                    .accentColor(secondaryColor)
                    .onAppear {
                        isSecureTextEntry.toggle()
                    }
                }
            }
            .padding(.horizontal, 8)
            .frame(height: 40)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(secondaryColor, lineWidth: 2))
            HStack {
                Text(textError)
                    .font(Font.system(size: 12))
                    .foregroundColor(.red)
                Spacer()
            }
        }
    }
}

struct BMTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        BMTextFieldView(textTitle: "Senha",
                        text: .constant(""),
                        isSecureType: true)
    }
}
