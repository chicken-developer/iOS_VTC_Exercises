//
//  ViewController.swift
//  swift_Buoi18
//
//  Created by Nguyen Manh Quynh on 12/18/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let stringURL = "http://3.bp.blogspot.com/-osiTjPqelwY/V1U-itqBrhI/AAAAAAAAAc0/KctZa7s24a4dTyfqCDNqyTSVnFjIbfY5QCK4B/s1600/doremon-2012-675609-1-s-307x512.jpg"
        if let url = URL(string: stringURL){
       
            do{
                let imageData = try Data(contentsOf: url)
                let img = UIImage(data:imageData )
                imageView.image = img
            }
            catch let err{
                print(err.localizedDescription)
            }
            
        }
        
        
    }
    
    
}

