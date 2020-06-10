//
//  MainPageViewController.swift
//  foodApp
//
//  Created by Nguyen Manh Quynh on 12/13/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit
//CollectionViewCell Config

class MainPageViewController: ViewController , UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var foodTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodTable.register(UINib(nibName: "foodCell", bundle: nil), forCellReuseIdentifier: "foodCellID")
        foodTable.dataSource = self
        foodTable.delegate = self
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 3
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = foodTable.dequeueReusableCell(withIdentifier: "foodCellID", for: indexPath) as! MainPage_tableViewCell
        let collectionViewCell = cell.foodCollectionView.dequeueReusableCell(withReuseIdentifier: "foodCollectionViewCellID", for: indexPath) as! foodCollectionViewCell
        collectionViewCell.foodImg_CollectionViewCell = UIImageView(image: UIImage(named: "Image.jpg"))
        collectionViewCell.foodName_CollectionViewCell.text = "This is name"
        return cell
    }
    
    
}






