//
//  Good.swift
//  AdvancedShop
//
//  Created by Aibar on 7/2/18.
//  Copyright © 2018 Kaskatay. All rights reserved.
//

import Foundation
class Good: Hashable, Equatable, Nameable{
    var name: String = ""
    var price: Int = 0
    var catalogueType: Category
    init(name: String, price: Int, catalogueType: Category) {
        self.name = name
        self.price = price
        self.catalogueType = catalogueType
    }
    lazy var hashValue: Int = ObjectIdentifier(self).hashValue
    
    static func ==(lhs: Good, rhs: Good) -> Bool {
        return lhs === rhs
    }
    
}
