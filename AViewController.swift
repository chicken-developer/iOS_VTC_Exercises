//
//  AViewController.swift
//  swift_Buoi13
//
//  Created by Nguyen Manh Quynh on 11/29/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class AViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        

        let btnNavigate = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
        btnNavigate.setTitle("Navigate To Scene2", for: .normal)
        btnNavigate.addTarget(self, action: #selector(AnavigatetoB), for: .touchUpInside)
        self.view.addSubview(btnNavigate)
    }
    
    @objc func AnavigatetoB(){
        print("clicked");
        guard let controller = self.navigationController?.viewControllers[0] else {return }
        self.navigationController?.popToViewController(controller, animated: true);
       
    }
    


}
