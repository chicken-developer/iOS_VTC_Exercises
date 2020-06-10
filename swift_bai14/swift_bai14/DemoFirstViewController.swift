//
//  DemoFirstViewController.swift
//  swift_bai14
//
//  Created by Nguyen Manh Quynh on 12/2/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class DemoFirstViewController: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func NavigateToSecondView(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
       if let mainView = storyboard.instantiateViewController(identifier: "mainStoryboard") as? ViewController{
        self.navigationController?.pushViewController(mainView, animated: true)
        self
        }
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
  

}
