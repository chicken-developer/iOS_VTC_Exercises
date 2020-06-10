//
//  TbViewCellController.swift
//  UserInfomationApp
//
//  Created by Nguyen Manh Quynh on 2/24/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class TbViewCellController: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet weak var ageLb: UILabel!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
