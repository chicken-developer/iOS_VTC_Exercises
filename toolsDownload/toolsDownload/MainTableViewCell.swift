//
//  MainTableViewCell.swift
//  toolsDownload
//
//  Created by Nguyen Manh Quynh on 12/20/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

protocol  MainTableViewCellDelegate : class {
    func downloadSong(cell : MainTableViewCell)
    func cancelSong( cell : MainTableViewCell)

}

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var processDownload: UIProgressView!
    @IBOutlet weak var percentlabel: UILabel!
    
    
    weak var delegate: MainTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func downloadSong(_ sender: Any) {
        delegate?.downloadSong(cell: self)
    }
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
