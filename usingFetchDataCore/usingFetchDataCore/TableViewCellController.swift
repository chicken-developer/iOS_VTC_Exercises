//
//  TableViewCellController.swift
//  usingFetchDataCore
//
//  Created by Nguyen Manh Quynh on 2/25/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class TableViewCellController: UITableViewCell {
    //MARK: Outlet
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
