//
//  listFoodTableViewCell.swift
//  foodApp_0.1
//
//  Created by Nguyen Manh Quynh on 12/13/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class listFoodTableViewCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
