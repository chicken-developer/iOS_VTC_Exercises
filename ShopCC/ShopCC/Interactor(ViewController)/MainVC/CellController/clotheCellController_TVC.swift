//
//  clotheCellController_TVC.swift
//  ShopCC
//
//  Created by Nguyen Manh Quynh on 2/1/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class clotheCellController_TVC: UITableViewCell {

    @IBOutlet weak var clotheImage: UIImageView!
    @IBOutlet weak var clotheDescription: UITextView!
    @IBOutlet weak var clotheName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
