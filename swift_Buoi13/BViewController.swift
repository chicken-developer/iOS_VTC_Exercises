//
//  BViewController.swift
//  swift_Buoi13
//
//  Created by Nguyen Manh Quynh on 11/29/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class BViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green

        
        
        let btnNavigate = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
        btnNavigate.setTitle("Navigate To Scene2", for: .normal)
        btnNavigate.addTarget(self, action: #selector(BNavigateA), for: .touchUpInside)
        self.view.addSubview(btnNavigate)
        // Do any additional setup after loading the view.
    }
    @objc func BNavigateA(){
        guard let controller = self.navigationController?.viewControllers[0] else {return}
        self.navigationController?.popToViewController(controller, animated: true)
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
