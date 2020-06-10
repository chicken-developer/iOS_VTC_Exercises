//
//  foodTableViewCell.swift
//  foodApp_0.1
//
//  Created by Nguyen Manh Quynh on 12/13/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class foodTableViewCell: UITableViewCell {

   
    
    @IBOutlet weak var foodCollectionViewOutlet: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension foodTableViewCell{
    func setCollectionViewDataSourceDelegate
        <D: UICollectionViewDataSource & UICollectionViewDelegate>
        (_ dataSourceDelegate: D, forRow row:Int){
        foodCollectionViewOutlet.dataSource = dataSourceDelegate
        foodCollectionViewOutlet.delegate = dataSourceDelegate
        foodCollectionViewOutlet.reloadData()
    }
}
