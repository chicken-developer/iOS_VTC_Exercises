//
//  DownloadService.swift
//  musicApp
//
//  Created by Nguyen Manh Quynh on 12/25/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

class DownloadService {
    
    var downloadsSession: URLSession!
    
    func startDownload(with track: Track) {
        guard let url = URL(string: track.previewUrl) else {
            return
        }
        
        let downloadTask = downloadsSession.downloadTask(with: url)
        
        downloadTask.resume()
    }
}
