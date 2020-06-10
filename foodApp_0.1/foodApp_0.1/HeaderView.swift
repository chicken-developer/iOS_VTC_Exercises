//
//  HeaderView.swift
//  foodApp_0.1
//
//  Created by Nguyen Manh Quynh on 12/13/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit
protocol HeaderViewDelegate: class {
       func viewMore()
  }
class HeaderView: UITableViewCell {
  
    @IBOutlet weak var headerTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
        // Initialization code
    }
    
    @IBAction func viewMore(_ sender: Any) {
        let header: String = headerTitle.text!
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "listFoodViewID") as! listFoodViewController
//        self.window?.rootViewController?.navigationController?.pushViewController(viewController, animated: true)
        self.window?.rootViewController?.present(viewController, animated: true, completion: {
        self.navigateToListFood(headerTitle: header)
         })
    }
    
    func navigateToListFood(headerTitle : String){
        
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
