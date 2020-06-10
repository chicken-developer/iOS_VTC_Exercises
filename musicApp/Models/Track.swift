//
//  Tracks.swift
//  musicApp
//
//  Created by Nguyen Manh Quynh on 12/25/19.
//  Copyright © 2019 Admin. All rights reserved.
//

    import UIKit

    struct Track: Codable {

        var trackName: String
        var artistName: String
        var previewUrl: String
        
        init(name: String, artist: String, previewURL: String) {
          self.trackName = name
          self.artistName = artist
          self.previewUrl = previewURL
        }
    }

