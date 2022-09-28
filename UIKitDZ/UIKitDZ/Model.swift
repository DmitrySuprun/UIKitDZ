//
//  Model.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 24.09.22.
//

import Foundation
/// Information about User
struct UserInfo {
    
    enum Sex {
        case male
        case female
    }
    
    let age: Int
    let sex: Sex
    var name: String
    var instagramAccount: String
    var logoImage: String
}
