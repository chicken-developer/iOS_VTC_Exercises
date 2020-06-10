//
//  SecondViewController.swift
//  passingDataTest
//
//  Created by Nguyen Manh Quynh on 2/24/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

protocol SecondVCDelegate: AnyObject {
    func updateInfo(_ info: Info)
}

class SecondViewController: UIViewController {

    @IBOutlet weak var id_SecondVC: UITextField!
    @IBOutlet weak var infoTextSecondVC: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backAndUpdate(_ sender: Any) {
        
    }
    

}
