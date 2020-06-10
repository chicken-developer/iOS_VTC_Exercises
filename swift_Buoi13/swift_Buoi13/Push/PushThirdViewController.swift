//
//  PushThirdViewController.swift
//  swift_Buoi13
//
//  Created by Nguyen Manh Quynh on 11/29/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class PushThirdViewController: UIViewController {

    @IBAction func navigateSC2(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func SC3navigateSC4(_ sender: Any) {
        self.performSegue(withIdentifier: "FourthPushViewController", sender: self)
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
