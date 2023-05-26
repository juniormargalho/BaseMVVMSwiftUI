//
//  BMToolbarTextFieldView.swift
//  BaseMVVMSwiftUI
//
//  Created by Junior Margalho on 26/05/23.
//

import SwiftUI

struct BMToolbarTextFieldView: View {
    var textTitle: String
    @Binding var text: String
    @Binding var isFocused: Bool
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
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            if isFocused {
                                Text(text.formatAddBetweenCharacters(" "))
                                    .font(fontTitle)
                                    .foregroundColor(secondaryColor)
                            }
                        }
                    }
                    .onTapGesture {
                        isFocused = true
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

struct BMToolbarTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        BMToolbarTextFieldView(textTitle: "Title",
                               text: .constant("Text"),
                               isFocused: .constant(true))
    }
}
