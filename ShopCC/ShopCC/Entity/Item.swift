//
//  Item.swift
//  ShopCC
//
//  Created by Nguyen Manh Quynh on 1/21/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

class Item {
    let itemName: String
    let itemPrince: Double
    let itemImgURL: URL
    let itemTrademake: String
    
    init(itemName: String, itemPrince: Double, itemImgURL: URL, itemTrademake: String) {
        self.itemName = itemName
        self.itemPrince = itemPrince
        self.itemImgURL = itemImgURL
        self.itemTrademake = itemTrademake
    }
}
