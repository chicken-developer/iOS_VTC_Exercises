//
//  ViewController.swift
//  toolsDownload
//
//  Created by Nguyen Manh Quynh on 12/20/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit


struct Results : Codable{
    var previewUrl : String
    var trackName : String
    var artistName : String
    
}
struct JSonData : Codable {
    var results: [Results]
}
var tracks = [Results]()



class ViewController: UIViewController, UITextFieldDelegate {
    
   
    @IBOutlet weak var ituneSongList: UITableView!
    @IBOutlet weak var inputSongName: UITextField!
    let downloadService = DownloadService()
    let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    let API_STRING = "https://itunes.apple.com/search?media=music&entity=song&term="
    let defaultSession = URLSession(configuration: .default)
    
    var dataTask: URLSessionDataTask?
    var currentIndexPath: IndexPath?
    lazy var downloadsSession: URLSession = {
        let configureation = URLSessionConfiguration.background(withIdentifier: "download")
        return URLSession(configuration: configureation, delegate: self, delegateQueue: nil)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.sendSubviewToBack(ituneSongList)
        ituneSongList.dataSource = self
        ituneSongList.delegate = self
        
        
        //ituneSongList.delegate = self
        
    }
    
    
    
    @IBAction func searchMusic(_ sender: Any) {
        let songName = inputSongName.text ?? ""
        
        if songName != "" {
            requestAPI(song: songName)
            ituneSongList.reloadData()
            self.view.bringSubviewToFront(ituneSongList)
            
        }
        else{
            print("Song name empty")
            self.view.sendSubviewToBack(ituneSongList)
        }
    }
    //        tracks = tracks.filter({ (track) -> Bool in
    //            let searchText = inputSongName.text!.lowercased()
    //
    //            if track.trackName.lowercased().contains(searchText) {
    //                return true
    //            } else {
    //                return false
    //            }
    //        })
    //
    //        ituneSongList.reloadData()
   
       
    
    private func requestAPI(song : String = "songname"){
        dataTask?.cancel()
        
        if var urlComponents = URLComponents(string: "https://itunes.apple.com/search"){
            urlComponents.query = "media=music&entity=song&term=" + song
            guard let url = urlComponents.url else {return}
            
            dataTask = defaultSession.dataTask(with: url, completionHandler: { (data, response, error) in
                if let error = error{
                    print(error.localizedDescription)
                } else if let data = data,
                    let response = response as? HTTPURLResponse,
                    response.statusCode == 200{
                    print("OK! ")
                    do{
                        let obj =  try JSONDecoder().decode(JSonData.self, from: data)
                        tracks = obj.results
                        
                        DispatchQueue.main.async {
                            self.ituneSongList.reloadData()
                            print("Success. ")
                        }
                        
                    } catch let err{
                        print(err.localizedDescription)
                    }
                }
                else { print("Err when create response")}
            })
        }
        dataTask?.resume()
    }
    
}

extension ViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Number elements in tracks: " , tracks.count)
        return tracks.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ituneSongList.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MainTableViewCell
        print(indexPath)
        let aTrack : Results = tracks[indexPath.row]
        cell.songName.text = aTrack.trackName
        cell.artistName.text = aTrack.artistName
        cell.delegate = self
        return cell
    }
}

extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

extension ViewController: MainTableViewCellDelegate {
    
    func downloadSong(cell: MainTableViewCell) {
        print("Enter download song")
         if let indexPath = ituneSongList.indexPath(for: cell) {
                   currentIndexPath = indexPath
                   let track = tracks[indexPath.row]
                   downloadService.startDownload(with: track)
               }
           
        
    }
    
    func cancelSong(cell: MainTableViewCell) {
        //
    }
    
    
}

extension ViewController: URLSessionDownloadDelegate {
func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
    
    
    guard let sourceURL = downloadTask.originalRequest?.url else {
        return
    }
    
    print(documentsPath)
    let lastPathComponent = sourceURL.lastPathComponent
    
    let destinationURL = documentsPath.appendingPathComponent(lastPathComponent)
    print(destinationURL)
    
    
    
    let fileManager = FileManager.default
    try? fileManager.removeItem(at: destinationURL)
    
    do {
        try fileManager.copyItem(at: location, to: destinationURL)
    } catch let error {
        print(error.localizedDescription)
    }
}
}
//func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
//
//    let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
//    let totalSize = ByteCountFormatter.string(fromByteCount: totalBytesExpectedToWrite, countStyle: .file)
//
//
//    DispatchQueue.main.async {
//        if let indexPath = self.currentIndexPath,
//          let cell = self.contentTableView.cellForRow(at: indexPath) as? SongTableViewCell {
//          cell.updateDisplay(progress: progress, totalSize: totalSize)
//      }
//    }
//
//
//    print("progress = \(progress) totalSize = \(totalSize)")
//}
