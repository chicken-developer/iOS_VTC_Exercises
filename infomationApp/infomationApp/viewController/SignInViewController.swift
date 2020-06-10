//
//  SignInViewController.swift
//  infomationApp
//
//  Created by Nguyen Manh Quynh on 12/2/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true;
        // Do any additional setup after loading the view.
    }
    
    @IBAction func navigateToInfoView(_ sender: Any) {
        self.performSegue(withIdentifier: "navigateToInfoView", sender: self)
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
