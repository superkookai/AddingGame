//
//  NumericExtension.swift
//  AddingGame
//
//  Created by Weerawut Chaiyasomboon on 2/12/2567 BE.
//

import Foundation

let ordinalFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .ordinal
    return formatter
}()

extension Numeric {
    var ordinal: String {
        ordinalFormatter.string(for: self) ?? String(describing: self)
    }
}
