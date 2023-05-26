//
//  Extension + UIApplication.swift
//  BaseMVVMSwiftUI
//
//  Created by Junior Margalho on 25/05/23.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
