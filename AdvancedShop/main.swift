//
//  main.swift
//  AdvancedShop
//
//  Created by Aibar on 7/2/18.
//  Copyright © 2018 Kaskatay. All rights reserved.
//

import Foundation
print("Enter your Name: ")
let userName = getln()
print("Hello Dear \(userName.capitalized), now enter how many CASH do you have: ")
let userBalance = getln()
print("Now Enter how many money do you have on your card: ")
let userCardBalance = getln()
var nurbek = User(name: userName, balance: Int(userBalance)!, cardBalance: Int(userCardBalance)!, cart: Cart(goods: [:], capacity: 3))
var adlet = User(name: "adlet", balance: 15123, cardBalance: 12312, cart: Cart(goods: [:], capacity: 5))
var shop = Shop(goods: [
    Good(name: "Coca-Cola", price: 150, catalogueType: .Drink): 3,
    Good(name: "Fuse Tea", price: 130, catalogueType: .Drink): 4,
    Good(name: "Pringles", price: 1000, catalogueType: .Snack): 5,
    Good(name: "Chicken Hamburger", price: 400, catalogueType: .FastFood): 10],
                user: nurbek, discounts: [
                    Good(name: "Fuse Tea", price: 130, catalogueType: .Drink): 2,
                    Good(name: "Pringles", price: 1000, catalogueType: .Snack): 3], users: [nurbek, adlet])
showMenu(shop: shop, user: &nurbek)
