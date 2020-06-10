//
//  TableViewCell.swift
//  noteApp
//
//  Created by Nguyen Manh Quynh on 1/10/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit


class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var DescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
