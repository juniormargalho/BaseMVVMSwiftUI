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
    var fontTitle: Font = Font.system(size: 16, weight: .semibold)
    var fontError: Font = Font.system(size: 14, weight: .regular)
    var primaryColor: Color = .black
    var secondaryColor: Color = .gray
    var tertiaryColor: Color = .red
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        VStack(spacing: 2) {
            HStack {
                Text(textTitle)
                    .font(fontTitle)
                    .foregroundColor(primaryColor)
                Spacer()
            }
            HStack {
                TextField(textTitle, text: $text)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .accentColor(primaryColor)
                    .keyboardType(keyboardType)
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

struct BMTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        BMTextFieldView(textTitle: "Nome",
                        text: .constant("Meu Nome"),
                        textError: "")
    }
}
