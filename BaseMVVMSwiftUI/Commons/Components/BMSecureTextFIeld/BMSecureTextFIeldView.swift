//
//  BMSecureTextFIeldView.swift
//  BaseMVVMSwiftUI
//
//  Created by Junior Margalho on 25/05/23.
//

import SwiftUI

struct BMSecureTextFIeldView: View {
    var textTitle: String
    @Binding var text: String
    var textError: String = ""
    var fontTitle: Font = Font.system(size: 16, weight: .semibold)
    var fontError: Font = Font.system(size: 14, weight: .regular)
    var primaryColor: Color = .black
    var secondaryColor: Color = .gray
    var tertiaryColor: Color = .red
    @State private var isSecureTextEntry: Bool = true
    
    var body: some View {
        VStack(spacing: 2) {
            HStack {
                Text(textTitle)
                    .font(fontTitle)
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
                Button(action: {
                    isSecureTextEntry.toggle()
                }) {
                    Image(systemName: isSecureTextEntry ? "eye.slash" : "eye")
                        .foregroundColor(secondaryColor)
                }
            }
            .padding(.horizontal, 8)
            .frame(height: 40)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(textError == "" ? secondaryColor : tertiaryColor, lineWidth: 2))
            HStack {
                Text(textError)
                    .font(fontError)
                    .foregroundColor(tertiaryColor)
                    .padding(.leading, 8)
                Spacer()
            }
        }
    }
}

struct BMSecureTextFIeldView_Previews: PreviewProvider {
    static var previews: some View {
        BMSecureTextFIeldView(textTitle: "Senha",
                              text: .constant(""),
                              textError: "")
    }
}
