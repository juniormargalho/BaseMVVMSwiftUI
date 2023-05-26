//
//  Extension + String.swift
//  BaseMVVMSwiftUI
//
//  Created by Junior Margalho on 26/05/23.
//

import Foundation

extension String {
    func formatAddBetweenCharacters(_ separator: String) -> String {
        let formattedString = self
            .filter(\.isNumber)
            .map(String.init)
            .joined(separator: separator)
        return formattedString
    }
}
