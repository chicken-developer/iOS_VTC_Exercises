//
//  TableViewCell.swift
//  TestLoadingImage_ver02
//
//  Created by Nguyen Manh Quynh on 1/4/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imageIndex: UILabel!
    @IBOutlet weak var tableViewImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
