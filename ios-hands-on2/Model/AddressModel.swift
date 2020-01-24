//
//  AddressModel.swift
//  ios-hands-on2
//
//  Created by junya.kawai on 2020/01/24.
//  Copyright © 2020 nextbeat. All rights reserved.
//

import Foundation

struct AddressModel: Codable {
    var results: [Result]

    struct Result: Codable {
        var address1: String
        var address2: String
        var address3: String
        var kana1:    String
        var kana2:    String
        var kana3:    String
    }
}
