//
//  TrackTableViewCell.swift
//  musicApp_version_0.1
//
//  Created by Nguyen Manh Quynh on 12/25/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

protocol  TrackTableViewCellDelegate: class {
    func downLoadTrack(_ cell: TrackTableViewCell)
    func cancleDownload(_ cell: TrackTableViewCell)
    func pauseDownload(_ cell: TrackTableViewCell)
    func playVideo(_ cell: TrackTableViewCell)
    func resumDownload(_ cell: TrackTableViewCell)
}

class TrackTableViewCell: UITableViewCell {

    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var fileInfomation: UILabel!
    @IBOutlet weak var downloadProgressBar: UIProgressView!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var downloadBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
    weak var delegate : TrackTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func downloadSong(_ sender: Any) {
        delegate?.downLoadTrack(self)
    }
    
    @IBAction func playSong(_ sender: Any) {
        delegate?.playVideo(self)
    }
    
    @IBAction func cancelDownload(_ sender: Any) {
        delegate?.cancleDownload(self)
    }
    
    @IBAction func pauseDownload(_ sender: Any) {
        delegate?.pauseDownload(self)
    }
    
    func updateDisplay(process: Float , totalSize: String){
          downloadProgressBar.progress = process
          fileInfomation.text = String(format: "%.1f%% of %@", process * 100, totalSize)
    }
}
