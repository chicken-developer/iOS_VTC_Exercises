//
//  UserTableViewCellController.swift
//  Employee
//
//  Created by Nguyen Manh Quynh on 2/26/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class UserTableViewCellController: UITableViewCell {
    
    //MARK: Outlet
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var userFirstnameLabel: UILabel!
    @IBOutlet weak var userLastnameLabel: UILabel!
    @IBOutlet weak var userPassportLabel: UILabel!
    @IBOutlet weak var numberOfTaskLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
