//
//  Storable.swift
//  AdvancedShop
//
//  Created by Aibar on 7/3/18.
//  Copyright © 2018 Kaskatay. All rights reserved.
//

import Foundation
protocol Storable {
    var goods: [Good: Int] {get set}
}
