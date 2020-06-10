//
//  InfomationViewController.swift
//  infomationApp
//
//  Created by Nguyen Manh Quynh on 12/2/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class InfomationViewController: UIViewController {

    @IBOutlet weak var birthdayInfo: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        birthdayInfo.setTitle("25 May 2019", for: .normal)
        self.navigationController?.navigationBar.isHidden = false;
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeBirthday(_ sender: Any) {
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
               if let changeBirthdayView = storyboard.instantiateViewController(identifier: "changeBirthday") as? ChangeBirthdayViewController{
                   self.present(changeBirthdayView,animated: true,completion: nil)
    }
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
