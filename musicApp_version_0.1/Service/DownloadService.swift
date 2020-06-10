//
//  DownloadService.swift
//  musicApp_version_0.1
//
//  Created by Nguyen Manh Quynh on 12/25/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

class DownLoadService{
    var downloadsSession: URLSession!
     
    var activeDownload : [String: DownloadObject ] = [:]
    
     func startDownload(with track: Track) {
         let download = DownloadObject(track: track)
        
//         guard let url = URL(string: track.previewUrl) else {
//              return
//         }
         let testPauseDownload = URL(string: "https://www.youtube.com/audiolibrary_download?vid=6722391bde350dc5")
         download.task = downloadsSession.downloadTask(with: testPauseDownload!)
         
        download.task?.resume()
        download.isDownloading = true
        activeDownload[download.track.previewUrl] = download
     }
    
    func cancleDownload(track : Track){
        guard let download = activeDownload[track.previewUrl] else {return}
        download.task?.cancel()
        activeDownload[track.previewUrl] = nil
    }
    
    func pauseDownload(track: Track){
        guard let download = activeDownload[track.previewUrl], download.isDownloading else {return}
        download.isDownloading = false
        download.task?.cancel(byProducingResumeData: { (data) in
            download.resumData = data
        })
    }
    
    func resumDownload(track: Track){
        guard let download = activeDownload[track.previewUrl] else {return}
        if let resumData = download.resumData {
            download.task = downloadsSession.downloadTask(withResumeData: resumData)
        }
        download.isDownloading = true
        download.task?.resume()
    }
    
    
}
