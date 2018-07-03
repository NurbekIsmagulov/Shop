//
//  Shop.swift
//  AdvancedShop
//
//  Created by Aibar on 7/2/18.
//  Copyright © 2018 Kaskatay. All rights reserved.
//

import Foundation
struct Shop {
    var goods: [Good: Int] = [:]
    var user: User
    var discounts: [Good: Int] = [:]
    var users: [User] = []
}

extension Shop: Showable, Storable{
    func show() {
        var temp: [Good] = []
        print("Here you can see menu: ")
        temp = goods.keys.filter({$0.catalogueType == .Drink})
        print("Drinks: ")
        for elem in temp{
            print("    \(elem.name) - \(elem.price)$, \(String(describing: goods[elem]!)) \(elem.name)(s) left")
        }
        temp = goods.keys.filter({$0.catalogueType == .Snack})
        print("Snacks: ")
        for elem in temp{
            print("    \(elem.name) - \(elem.price)$, \(String(describing: goods[elem]!)) \(elem.name)(s) left")
        }
        temp = goods.keys.filter({$0.catalogueType == .FastFood})
        print("Fast Foods: ")
        for elem in temp{
            print("    \(elem.name) - \(elem.price)$, \(String(describing: goods[elem]!)) \(elem.name)(s) left")
        }
    }
}
