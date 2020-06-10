//
//  Track.swift
//  musicApp_version_0.1
//
//  Created by Nguyen Manh Quynh on 12/25/19.
//  Copyright © 2019 Admin. All rights reserved.
//


import UIKit

struct Track: Codable {

    var trackName: String
    var artistName: String
    var previewUrl: String
    var downloaded: Bool
    var index = 0
    
    init(name: String, artist: String, previewURL: String , index: Int) {
      self.index = index
      self.trackName = name
      self.artistName = artist
      self.previewUrl = previewURL
      self.downloaded = false
    }
    
}
