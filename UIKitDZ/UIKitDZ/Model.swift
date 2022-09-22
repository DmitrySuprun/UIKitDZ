//
//  Model.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 22.09.22.
//

import Foundation
/// ConvertStringModel
struct ConvertStringModel {
    var originalString = ""
    var convertedString: String {
        String(originalString.reversed())
    }
}
