//
//  listFoodViewController.swift
//  foodApp_0.1
//
//  Created by Nguyen Manh Quynh on 12/13/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

protocol TableViewInsideCollectionViewDelegate:class {
    func cellTaped(data:IndexPath)
}

class listFoodViewController: UIViewController {

    @IBOutlet weak var listFoodTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        listFoodTableView.delegate = self
        listFoodTableView.dataSource = self
    }
}

extension listFoodViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listFoodTableView.dequeueReusableCell(withIdentifier: "listFoodTableViewCellID", for: indexPath) as! listFoodTableViewCell
        cell.foodName.text = "Food"
        cell.foodDescription.text = "foodDes"
        cell.imgView.image = UIImage(named: "food_01.jpg")
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let storyBoard = UIStoryboard(name: "Main", bundle: nil)
               let viewController = storyBoard.instantiateViewController(withIdentifier: "scrollFoodViewID") as! scrollFoodViewController
      self.present(viewController, animated: true, completion: nil)
    }
}
extension listFoodViewController : UITableViewDelegate{
    
}
