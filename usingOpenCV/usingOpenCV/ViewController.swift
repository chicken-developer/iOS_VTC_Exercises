//
//  ViewController.swift
//  usingOpenCV
//
//  Created by Nguyen Manh Quynh on 1/30/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let openCV = OpenCVWarpper.init()
        
        print("\(OpenCVWarpper.openCVVersionString())")
        // Do any additional setup after loading the view.
    }


}

