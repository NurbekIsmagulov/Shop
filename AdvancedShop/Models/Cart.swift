//
//  Cart.swift
//  AdvancedShop
//
//  Created by Aibar on 7/2/18.
//  Copyright © 2018 Kaskatay. All rights reserved.
//

import Foundation
struct Cart {
    var goods: [Good: Int] = [:]
    var capacity: Int =  0
}
extension Cart: Showable, Storable {
    func show() {
        if goods.keys.count > 0 {
            print("Here you can see your Cart: ")
            for elem in goods.keys{
                print("    \(String(describing: goods[elem]!)) \(elem.name)")
            }
            let sum = goods.keys.map({$0.price * goods[$0]!}).reduce(0, +)
            print("    Your cart totally costs \(sum)$")
        }
        else {
            print("Your cart is empty, buy something and try again")
        }
    }
}
