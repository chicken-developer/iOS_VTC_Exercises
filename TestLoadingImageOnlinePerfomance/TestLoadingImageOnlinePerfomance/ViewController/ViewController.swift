//
//  ViewController.swift
//  TestLoadingImageOnlinePerfomance
//
//  Created by Nguyen Manh Quynh on 12/27/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit
var Images : [String] = []
   
class ViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let file = "Untitled.txt"
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(file)
            
            do {
                let textSource = try String(contentsOf: fileURL, encoding: .utf8)
                let imageURLs = textSource.split { $0.isNewline }
                for imageURL in imageURLs {
                    Images.append(String(imageURL))
                }
                print(Images[0])
            }
            catch let error
            {
                print(error.localizedDescription)
            }
        }
    }
    
    @IBAction func NavigateToTableView(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}

