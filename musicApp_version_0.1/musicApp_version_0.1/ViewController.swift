//
//  ViewController.swift
//  musicApp_version_0.1
//
//  Created by Nguyen Manh Quynh on 12/25/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var trackTableView: UITableView!
    
    let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    let getDataFromAPI = getDataFromAPIService()
    let downloadService = DownLoadService()
    let fileManager = FileManager.default
    var player : AVAudioPlayer!
    let pathAtIndex = ""
    
    var trackResults: [Track] = []
    var arrTrackDownLoadedID = [String]()
    var currentIndexPath: IndexPath?
    var currentTrackPath = ""
    
    lazy var tapRecognizer: UITapGestureRecognizer = {
        var recognizer = UITapGestureRecognizer(target:self, action: #selector(dismissKeyboard))
        return recognizer
    }()
    
    lazy var downloadsSession: URLSession = {
        let configureation = URLSessionConfiguration.background(withIdentifier: "download")
        return URLSession(configuration: configureation, delegate: self, delegateQueue: nil)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getTrackWithName("Loi nho")
        trackTableView.delegate = self
        trackTableView.dataSource = self
        downloadService.downloadsSession = downloadsSession
    }
    
    @objc func dismissKeyboard() {
        searchBar.resignFirstResponder()
    }
    
    private func getTrackWithName(_ songName: String) {
        getDataFromAPI.getSearchResults(searchTerm: songName) { [weak self] results, errorMessage in
            
            if let results = results {
                self?.trackResults = results
                //                for track in results{
                //                    for index in 1...self!.arrTrackDownLoadedID.count {
                //                        if track.previewUrl == self?.arrTrackDownLoadedID[index]{
                //                            track.downloaded = true
                //                        }
                //                    }
                //
                //                }
                self?.trackTableView.reloadData()
            }
            
            if !errorMessage.isEmpty {
                print("Search error: " + errorMessage)
            }
            
        }
    }
    
    public func prepareToPlayTrack(trackName : String){
        guard let path = Bundle.path(forResource: trackName, ofType: nil, inDirectory: documentsPath.path) else {return }
        guard let audioURL = URL(string: path) else{ return}
        do {
            player = try AVAudioPlayer(contentsOf: audioURL)
            player.prepareToPlay()
        } catch let err{ print(err.localizedDescription )}
    }
    
    public func switchTrackStatus(status: String, cell: TrackTableViewCell){
        switch status {
        case "normal": break
            
        case "downloading":
            cell.downloadBtn.isHidden = true
            cell.pauseBtn.isHidden = false
            cell.cancelBtn.isHidden = false
            cell.playBtn.isHidden = true
            cell.downloadProgressBar.isHidden = false
        case "pause":
            cell.downloadBtn.isHidden = true
            cell.pauseBtn.isHidden = false
            cell.cancelBtn.isHidden = false
            cell.playBtn.isHidden = true
            cell.downloadProgressBar.isHidden = false
        case "downloaded":
            cell.downloadBtn.isHidden = true
            cell.pauseBtn.isHidden = true
            cell.cancelBtn.isHidden = true
            cell.playBtn.isHidden = false
            cell.downloadProgressBar.isHidden = true
        case "playing":
            cell.downloadBtn.isHidden = true
            cell.pauseBtn.isHidden = true
            cell.cancelBtn.isHidden = true
            cell.playBtn.isHidden = false
            cell.downloadProgressBar.isHidden = true
        default:
            print("Err")
        }
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        dismissKeyboard()
        
        guard let searchText = searchBar.text, !searchText.isEmpty else {
            return
        }
        
        getTrackWithName(searchText)
        player.stop()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        view.addGestureRecognizer(tapRecognizer)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        view.removeGestureRecognizer(tapRecognizer)
    }
}



extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trackResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! TrackTableViewCell
        let trackAtIndexPath = trackResults[indexPath.row]
        cell.artistNameLabel.text = trackAtIndexPath.artistName
        cell.songNameLabel.text = trackAtIndexPath.trackName
        
        switch trackAtIndexPath.downloaded {
        case true:
            switchTrackStatus(status: "downloaded", cell: cell)
            break
        case false:
            switchTrackStatus(status: "normal", cell: cell)
            break
        default:
            switchTrackStatus(status: "normal", cell: cell)
            break
            //
        }
        cell.delegate = self
        arrTrackDownLoadedID.append(trackAtIndexPath.previewUrl)
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}



extension ViewController: TrackTableViewCellDelegate {
    
    func cancleDownload(_ cell: TrackTableViewCell) {
        if let indexPath = trackTableView.indexPath(for: cell) {
            currentIndexPath = indexPath
            let track = trackResults[indexPath.row]
            downloadService.cancleDownload(track: track)
            trackTableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    func pauseDownload(_ cell: TrackTableViewCell) {
        if let indexPath = trackTableView.indexPath(for: cell) {
            currentIndexPath = indexPath
            let track = trackResults[indexPath.row]
            downloadService.pauseDownload(track: track)
        }
    }
    func resumDownload(_ cell: TrackTableViewCell) {
        if let indexPath = trackTableView.indexPath(for: cell) {
            currentIndexPath = indexPath
            let track = trackResults[indexPath.row]
            downloadService.resumDownload(track: track)
        }
    }
    
    func downLoadTrack(_ cell: TrackTableViewCell) {
        if let indexPath = trackTableView.indexPath(for: cell) {
          //  currentIndexPath = indexPath
            let track = trackResults[indexPath.row]
            downloadService.startDownload(with: track)
        }
    }
    
    
    func playVideo(_ cell : TrackTableViewCell){
        if let indexPath = trackTableView.indexPath(for: cell) {
            currentIndexPath = indexPath
            let track = trackResults[indexPath.row]
            currentTrackPath = URL(string: track.previewUrl)?.lastPathComponent ?? ""
            prepareToPlayTrack(trackName: currentTrackPath)
            player.play()
        }
    }
}


extension ViewController: URLSessionDelegate {
    
}

extension ViewController: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
        
        guard let sourceURL = downloadTask.originalRequest?.url else {
            return
        }
        
        print(documentsPath)
        let lastPathComponent = sourceURL.lastPathComponent
        currentTrackPath = lastPathComponent
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
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        
        guard let sourceURLPath = downloadTask.originalRequest?.url,
            let download = downloadService.activeDownload[sourceURLPath.absoluteString] else {return}
        download.progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        let totalSize = ByteCountFormatter.string(fromByteCount: totalBytesExpectedToWrite, countStyle: .file)
        
        DispatchQueue.main.async {
            let newIndexPath = IndexPath(row: download.track.index, section: 0)
            if //let indexPath = self.currentIndexPath,
                let cell = self.trackTableView.cellForRow(at: newIndexPath) as? TrackTableViewCell {
                cell.updateDisplay(process: download.progress, totalSize: totalSize)
                
//                if download.progress  < 1 {
//                    self.switchTrackStatus(status: "downloading", cell: cell)
//                }
//                else if download.progress == 1 {
//                    self.switchTrackStatus(status: "downloaded", cell: cell)
//                }
                //                if(progress < 1){
                //                    print("Downloading")
                //                    cell.downloadBtn.setTitle("Downloading", for: .normal)
                //                    cell.playBtn.isEnabled = true
                //                    cell.playBtn.setTitle("Cancle", for: .normal)
                //                    //
                //                }
                //
                //                else if(progress == 1){
                //                    print("download completed")
                //                    cell.playBtn.setTitle("Play", for: .normal)
                //                    cell.playBtn.isEnabled = true
                //                    cell.downloadBtn.setTitle("Downloaded", for: .normal)
                //                    cell.downloadBtn.isEnabled = false
                //
                //                }
            }
        }
        
    }
    
}
