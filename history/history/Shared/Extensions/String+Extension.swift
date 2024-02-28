//
//  String+Extension.swift
//  history
//
//  Created by cuongdd on 27/02/2024.
//

import Foundation

extension String {
    var folded: String {
        return self.folding(options: .diacriticInsensitive, locale: nil)
            .replacingOccurrences(of: "đ", with: "d")
            .replacingOccurrences(of: "Đ", with: "D")
    }
    
    func unaccent() -> String {
        return self.folding(options: .diacriticInsensitive, locale: .current)
    }
}
