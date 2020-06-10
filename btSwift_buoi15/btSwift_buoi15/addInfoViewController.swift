//
//  addInfoViewController.swift
//  btSwift_buoi15
//
//  Created by Nguyen Manh Quynh on 12/9/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class addInfoViewController: UIViewController {

    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var descriptionTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addInfo(_ sender: Any) {
        var title = titleLabel.text
        var description = descriptionTextField.text
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let myList = storyboard.instantiateViewController(identifier: "myList") as? myListController{
          
    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
