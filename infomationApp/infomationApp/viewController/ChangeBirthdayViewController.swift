//
//  ChangeBirthdayViewController.swift
//  infomationApp
//
//  Created by Nguyen Manh Quynh on 12/2/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ChangeBirthdayViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func change_birthdayConfirm(_ sender: Any) {
        let formatter = DateFormatter()
        let date = datePicker.date
        formatter.dateFormat = "dd-MMM-yyyy"
        let myStringafd = formatter.string(from: date)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                      if let infomationView = storyboard.instantiateViewController(identifier: "infomationView") as? InfomationViewController{
                        
                          infomationView.birthdayInfo.setTitle(myStringafd, for: .normal)
                          self.present(infomationView,animated: true,completion: nil)
        }
        
    }
    
    @IBAction func touchOnBackgr(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    @IBAction func cancel(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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


