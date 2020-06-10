//
//  ViewController.swift
//  bt_gesture
//
//  Created by Nguyen Manh Quynh on 12/6/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let arrImgName = ["0.jpg","1.jpg","2.jgp","3.jpg","4.jpg","5.jgp","6.jpg"]
    var myImage = UIImage(named: "0.jpg")
    var index = 0
    @IBOutlet var swipeGestureOutlet: UISwipeGestureRecognizer!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBAction func swipeImage(_ sender: UISwipeGestureRecognizer) {
        
        
            if swipeGestureOutlet.direction == .right{
                print(index)
                if index == 7 {
                    index = 0
                    myImage = UIImage(named: arrImgName[0])
                    myImageView.image = myImage
                    index += 1

                }
                else{
                    myImage = UIImage(named: arrImgName[index])
                    myImageView.image = myImage
                    index += 1

                }
            }
            else if swipeGestureOutlet.direction == .left{
                print(index)

                if index == -1 {
                    index = 6
                    myImage = UIImage(named: arrImgName[6])
                    myImageView.image = myImage
                    index -= 1

                }
                else{
                    myImage = UIImage(named: arrImgName[index])
                    myImageView.image = myImage
                    index -= 1
                }
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

