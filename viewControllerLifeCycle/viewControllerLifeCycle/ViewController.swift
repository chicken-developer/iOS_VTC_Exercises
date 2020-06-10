//
//  ViewController.swift
//  viewControllerLifeCycle
//
//  Created by Nguyen Manh Quynh on 12/4/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          print("B Enter View Appear")
      }
      
      override func viewDidAppear(_ animated: Bool) {
          super.viewDidAppear(animated)
          print("B Enter View DidAppear")
      }
      override func viewWillDisappear(_ animated: Bool) {
          super.viewWillDisappear(animated)
          print("B Enter View WillDisAppear")
      }
      override func viewDidDisappear(_ animated: Bool) {
          super.viewDidDisappear(animated)
          print("B Enter View Did Disappear")
      }

}

