//
//  TableViewCell_track.swift
//  musicApp
//
//  Created by Nguyen Manh Quynh on 12/25/19.
//  Copyright © 2019 Admin. All rights reserved.
//
import UIKit
protocol TableViewCell_trackDelegate: class {
    func downloadTapped(_ cell: TableViewCell_track)
    func cancelTapped(_ cell: TableViewCell_track)
}

class TableViewCell_track: UITableViewCell, Cell {
    
    
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var downloadProgress: UIProgressView!
    @IBOutlet weak var percentLabel: UILabel!
    weak var delegate: TableViewCell_trackDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func downloadButton_clicked(_ sender: Any) {
        delegate?.downloadTapped(self)
    }
    
    func visulizeCell(with track: Track) {
        songNameLabel.text = track.trackName
        artistLabel.text = track.artistName
    }
    
    func updateDisplay(progress: Float, totalSize : String) {
      downloadProgress.progress = progress
      percentLabel.text = String(format: "%.1f%% of %@", progress * 100, totalSize)
    }
}
