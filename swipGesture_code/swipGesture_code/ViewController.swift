//
//  ViewController.swift
//  swipGesture_code
//
//  Created by Nguyen Manh Quynh on 12/9/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        leftSwipeGesture.direction = .left
        
        let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        rightSwipeGesture.direction = .right
        
        myImageView.addGestureRecognizer(leftSwipeGesture)
        myImageView.addGestureRecognizer(rightSwipeGesture)
        

    }
    
    let arrImg = ["0.jpg","1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg"]
    var index = 0
    @IBAction func handleSwipe(_ sender: UISwipeGestureRecognizer) {
        var image = UIImage()
        switch sender.direction {
        case .left:
            if index == 0 {
                index = arrImg.count - 1
            }
            else {
                index -= 1
            }
            
        case .right:
            if index == arrImg.count - 1 {
                index = 0
            }
            else {
                index += 1
            }
            
        default:
            print("Have err")
        }
        image = UIImage(named: arrImg[index])!
        myImageView.image = image
    }
    
}
