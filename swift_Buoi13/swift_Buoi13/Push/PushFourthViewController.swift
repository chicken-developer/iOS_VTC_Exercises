//
//  PushFourthViewController.swift
//  swift_Buoi13
//
//  Created by Nguyen Manh Quynh on 11/29/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class PushFourthViewController: UIViewController {

    @IBAction func navigate2ndSC(_ sender: Any) {
       
       guard let controller = self.navigationController?.viewControllers[1] else {return}
        self.navigationController?.popToViewController(controller, animated: true)
    }
    @IBAction func SC4navigateRoot(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func SC4navigateSC3(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
