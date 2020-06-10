//
//  Home_MainVC.swift
//  ShopCC
//
//  Created by Nguyen Manh Quynh on 1/21/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import AVFoundation

class Home_MainVC: UIViewController {
//MARK: -Outlet
    @IBOutlet weak var clotheTypesScrollView: UIScrollView!
    @IBOutlet weak var clotheListTbview: UITableView!
    @IBOutlet weak var userMenuScrollView: UIScrollView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchWithImage: UIButton!
    @IBOutlet weak var userNameLabel: UILabel!
    
    
    override func viewDidLoad() {
        print("Enter a new viewcontroller")
        super.viewDidLoad()
        clotheListTbview.delegate = self
        clotheListTbview.dataSource = self
    }
    
    //MARK: - Button Action
    
    @IBAction func loadAPicture(_ sender: Any) {
        
    }
}
    
    //MARK: -Function for get image


//MARK: -TableView Extension
extension Home_MainVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = clotheListTbview.dequeueReusableCell(withIdentifier: "clotheCellID", for: indexPath) as! clotheCellController_TVC
        cell.clotheImage.image = UIImage(named: "redDress.jpg")
        cell.clotheName.text = "Vay mau do"
        cell.clotheDescription.text = "Day la 1 cai vay mau do dung lam san pham tam thoi"
        return cell
    }
    
    
}
extension Home_MainVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
    }
}

