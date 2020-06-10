//
//  Image.swift
//  TestLoadingImageOnlinePerfomance
//
//  Created by Nguyen Manh Quynh on 12/27/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
class Image{
    var imageName: String
    var index: Int
    var url : String
    init( imageName : String, index: Int, url: String){
        self.imageName = imageName
        self.index = index
        self.url = url
        }
}
