//
//  ViewController.swift
//  testMultiCode
//
//  Created by Nguyen Manh Quynh on 1/21/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var takeAPhoto: UIButton!
    @IBOutlet weak var resizePhoto: UIButton!
    @IBOutlet weak var getURL: UIButton!
    @IBOutlet weak var imgView_None: UIImageView!
    @IBOutlet weak var imgView_resized: UIImageView!
    @IBOutlet weak var urlLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(OpenCVWarpper.openCVVersionString())")

    }
    
    @IBAction func takePhoto(_ sender: Any) {
        
    }
    @IBAction func resizeImage(_ sender: Any) {
    
    }
    
    @IBAction func getURLAction(_ sender: Any) {
   
    }
    
    
}

