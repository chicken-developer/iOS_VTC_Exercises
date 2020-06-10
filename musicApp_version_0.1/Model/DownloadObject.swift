//
//  DownloadObject.swift
//  musicApp_version_0.1
//
//  Created by Nguyen Manh Quynh on 12/25/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit
class DownloadObject{
    
    var isDownloading = false
    var progress : Float = 0
    var resumData: Data?
    var task: URLSessionDownloadTask?
    var track : Track
    
    init(track: Track){
        self.track = track
    }
}
