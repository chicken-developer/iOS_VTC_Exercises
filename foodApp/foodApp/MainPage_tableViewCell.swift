//
//  MainPage_tableViewCell.swift
//  foodApp
//
//  Created by Nguyen Manh Quynh on 12/9/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class MainPage_tableViewCell: UITableViewCell,UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
   
    let cellOnRow: CGFloat = 5
    let cellSpace: CGFloat = 10
    let lineSpace: CGFloat = 30
    @IBOutlet weak var foodCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.foodCollectionView.dataSource = self
        self.foodCollectionView.delegate = self
        self.foodCollectionView.register(UINib.init(nibName: "foodCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "foodCollectionViewCellID")
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
   
       
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        return cell
       }
       
       
      
       
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
           
           let collectionViewWidth = foodCollectionView.frame.width
           let cellHeight = (collectionViewWidth - cellSpace * (cellOnRow - 1)) / cellOnRow
           let cellWidth = cellHeight
           return CGSize(width: cellWidth, height: cellHeight)
       }

       
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
       return lineSpace
       }

    
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
           return cellSpace
       }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
       }
    
}
