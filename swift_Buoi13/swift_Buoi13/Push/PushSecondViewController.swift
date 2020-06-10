//
//  PushSecondViewController.swift
//  swift_Buoi13
//
//  Created by Nguyen Manh Quynh on 11/29/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class PushSecondViewController: UIViewController {

   
    @IBAction func navigateSC1(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func navigateSC3(_ sender: Any) {
        self.performSegue(withIdentifier: "ThirdPushViewController", sender: self)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
