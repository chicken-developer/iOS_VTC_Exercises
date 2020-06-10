//
//  ViewController.swift
//  busApp
//
//  Created by Nguyen Manh Quynh on 12/3/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myCollectionView: UICollectionView!
    
    var Row1 = [1,0,1,0,1]
    var Row2 = [1,0,1,0,1]
    var Row3 = [1,0,1,0,1]
    var Row4 = [1,0,1,0,1]
    var Row5 = [1,0,1,0,1]
    var Row6 = [1,1,1,1,1]
    var chairArr = [[Int]]()
    
    //CollectionViewCell Config
    let cellOnRow: CGFloat = 5
    let cellSpace: CGFloat = 10
    let lineSpace: CGFloat = 30
    
    let imagechair = UIImage(named: "icon_chair.png")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chairArr.append(Row1)
        chairArr.append(Row2)
        chairArr.append(Row3)
        chairArr.append(Row4)
        chairArr.append(Row5)
        chairArr.append(Row6)
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        // Do any additional setup after loading the view.
    }


}


extension ViewController : UICollectionViewDataSource{
   
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int{
        return chairArr.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
        }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = indexPath.section
        let item = indexPath.item
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        if chairArr[section][item] == 0{
            cell.chairImage.image = imagechair
        }
        
        
        return cell
    }
    
    
}
extension ViewController : UICollectionViewDelegate{

}
extension ViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        let collectionViewWidth = myCollectionView.frame.width
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

