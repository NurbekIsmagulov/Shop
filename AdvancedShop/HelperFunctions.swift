//
//  HelperFunctions.swift
//  AdvancedShop
//
//  Created by Aibar on 7/2/18.
//  Copyright © 2018 Kaskatay. All rights reserved.
//

import Foundation

func getln() -> String {
    let stdin = FileHandle.standardInput
    var input = NSString(data: stdin.availableData, encoding: String.Encoding.utf8.rawValue)
    input = input!.trimmingCharacters(in: NSCharacterSet.newlines) as NSString
    return input! as String
}


func showMenu(shop: Shop, user: inout User){
    
    print("""
Choose one of this functions:
    1) Show
    2) Choose
    3) Cart
    4) Checkout
    5) Remove
    6) User
    7) Exit
""")
    let choice = getln()
    switch choice.lowercased(){
    case "show":
        shop.show()
        showMenu(shop: shop, user: &user)
        break
    case "choose":
        addGoodsToCart(user: &user)
        showMenu(shop: shop, user: &user)
        break
    case "cart":
        user.cart.show()
        showMenu(shop: shop, user: &user)
        break
    case "checkout":
        checkoutCart(user: &user)
        showMenu(shop: shop, user: &user)
        break
    case "remove":
        removeGood(user: &user)
        showMenu(shop: shop, user: &user)
        break
    case "user":
        changeUser()
        showMenu(shop: shop, user: &user)
        break
    case "exit":
        print("Bye \(user.name)")
        exit(0)
        break
    default:
        print("Sorry we don't have function like that. Try again")
        showMenu(shop: shop, user: &user)
        break
    }
}

func addGoodsToCart(user: inout User){
    let good = getln()
    if user.cart.capacity > user.cart.goods.keys.count{
        for elem in shop.goods.keys{
            if good.lowercased() == elem.name.lowercased(){
                if shop.goods[elem]! > 0{
                    if (user.cart.goods.keys.contains(elem)){
                        user.cart.goods[elem]! += 1
                    }
                    else{
                        user.cart.goods[elem] = 1
                    }
                    shop.goods[elem]! -= 1
                    print("\(elem.name) added to your Cart \(user.name.capitalized)")
                }
                else{
                    print("Sorry we haven't \(elem.name.uppercased()).")
                }
            }
        }
    }
    else{
        print("Your Cart is full. Remove something if you want to buy it")
    }
}

func checkoutCart(user: inout User){
    let sum = user.cart.goods.keys.map({$0.price * user.cart.goods[$0]!}).reduce(0, +)
    print("If you want to pay with your CASH enter YES, else if with your card enter NO")
    let paymentType = getln()
    if paymentType.lowercased() == "yes"{
        if sum > user.balance{
            print("You don't have enough CASH money to buy products in your cart. Please remove something and try again")
        }
        else{
            user.balance -= sum
            user.cart.goods.removeAll()
            print("You successfully bought products in your cart!!! Now you have \(user.balance)$")
        }
    }
    else if paymentType.lowercased() == "no"{
        if sum > user.cardBalance{
            print("You don't have enough money on your CARD to buy products in your cart. Please remove something and try again")
        }
        else{
            user.cardBalance -= sum
            user.cart.goods.removeAll()
            print("You successfully bought products in your cart!!! Now you have \(user.cardBalance)$ on your CARD")
        }
    }
    else{
        print("Only YES or NO BROW")
    }
}

func changeUser(){
    let user = getln()
    for i in shop.users{
        if i.name == user{
            shop.user = i
            print("Hello \(shop.user.name.capitalized)")
            break
        }
    }
}

func removeGood(user: inout User){
    let good = getln()
    for elem in user.cart.goods.keys{
        if good.lowercased() == elem.name.lowercased(){
            if user.cart.goods[elem] == 1{
                user.cart.goods.remove(at: user.cart.goods.index(forKey: elem)!)
            }
            else{
                user.cart.goods[elem]! -= 1
            }
            shop.goods[elem]! += 1
            print("You successfully removed \(elem.name)")
            break
        }
    }
}

