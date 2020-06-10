//
//  ViewController.swift
//  swift_bai14
//
//  Created by Nguyen Manh Quynh on 12/2/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func backToXib(_ sender: Any) {
        guard let controller = self.navigationController?.viewControllers[0] else{return}
        self.navigationController?.popToViewController(controller, animated: true);
        
    }
    

}

