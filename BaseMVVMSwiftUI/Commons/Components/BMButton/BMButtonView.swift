//
//  BMButtonView.swift
//  BaseMVVMSwiftUI
//
//  Created by Junior Margalho on 24/05/23.
//

import SwiftUI

struct BMButtonView: View {
    var title: String
    var font: Font = Font.system(size: 16, weight: .bold)
    var type: TypeButton = .primary
    var isDisabled: Bool = false
    var primaryColor: Color = .black
    var secondaryColor: Color = .white
    var tertiaryColor: Color = .gray
    var height: CGFloat = 40
    var corner: CGFloat = 4
    var didTouchButton: (() -> Void)
    
    enum TypeButton {
        case primary
        case secondary
    }
    
    var body: some View {
        Button {
            didTouchButton()
        } label: {
            switch type {
            case .primary:
                labelPrimaryButton
            case .secondary:
                labelSecondaryButton
            }
        }
        .disabled(isDisabled)
    }
}

extension BMButtonView {
    private var labelPrimaryButton: some View {
        Text(title)
            .font(font)
            .foregroundColor(secondaryColor)
            .frame(height: height)
            .frame(maxWidth: .infinity)
            .background(isDisabled ? tertiaryColor : primaryColor)
            .cornerRadius(corner)
    }
    
    private var labelSecondaryButton: some View {
        Text(title)
            .font(font)
            .foregroundColor(isDisabled ? tertiaryColor : primaryColor)
            .frame(height: height)
            .frame(maxWidth: .infinity)
            .overlay(
                RoundedRectangle(cornerRadius: corner)
                    .stroke(isDisabled ? tertiaryColor : primaryColor, lineWidth: 1.5))
    }
}

struct BMButtonView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            BMButtonView(title: "OK",
                         didTouchButton: {})
            BMButtonView(title: "Cancel",
                         type: .secondary,
                         primaryColor: .red,
                         didTouchButton: {})
        }
    }
}
