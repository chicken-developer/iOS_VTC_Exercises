//
//  ViewController.swift
//  foodApp_0.1
//
//  Created by Nguyen Manh Quynh on 12/13/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

//CollectionViewCell Config
let cellOnRow: CGFloat = 1
let cellSpace: CGFloat = 1
let lineSpace: CGFloat = 0
class ViewController: UIViewController, HeaderViewDelegate {
    func viewMore() {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "listFoodViewID") as! listFoodViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let img = UIImage(named: "foodwallpaper.jpg")
        
        let headerView = UIImageView(image: img)
        headerView.frame = CGRect(x: 0, y: 0, width: 414, height: 300)
        mainTableView.tableHeaderView = headerView
    }
}

extension ViewController : UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)?.first as! HeaderView
        var headertext = ""
        switch section {
        case 0:
            headertext = "Khuyến Mãi"
        case 1:
            headertext = "Mới nhất"
        case 2:
            headertext = "Món ăn ngon"
        default:
            headertext = ""
        }
        headerView.headerTitle.text = headertext
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCellID", for: indexPath) as! foodTableViewCell
        return cell
    }
    
    
}
extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
}
extension ViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCellID", for: indexPath)
            as! foodCollectionViewCell
        return collectionCell
    }
    
    
}
extension ViewController : UICollectionViewDelegate{
    
}
extension ViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let cellHeight = 175
        let cellWidth = 160
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

