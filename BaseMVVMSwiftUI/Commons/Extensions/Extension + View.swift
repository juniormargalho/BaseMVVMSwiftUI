//
//  Extension + View.swift
//  BaseMVVMSwiftUI
//
//  Created by Junior Margalho on 25/05/23.
//

import SwiftUI

extension View {
    func roundedCorner(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}
