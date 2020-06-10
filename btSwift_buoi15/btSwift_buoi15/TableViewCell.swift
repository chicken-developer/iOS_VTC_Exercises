//
//  TableViewCell.swift
//  btSwift_buoi15
//
//  Created by Nguyen Manh Quynh on 12/9/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit


class TableViewCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var titleLabelText: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
