//
//  scrollFoodViewController.swift
//  foodApp_0.1
//
//  Created by Nguyen Manh Quynh on 12/16/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit


class scrollFoodViewController: UIViewController {
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet var swipeFood: UISwipeGestureRecognizer!
    let imgName = ["foodw_01.jpg","foodw_02.jpg","foodw_03.jpg","foodw_04.jpg"]
    
    @IBAction func swipeNextFood(_ sender: Any) {
    }
    override func viewDidLoad() {
        let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        leftSwipeGesture.direction = .left
        
        let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        rightSwipeGesture.direction = .right
        foodImage.addGestureRecognizer(leftSwipeGesture)
        foodImage.addGestureRecognizer(rightSwipeGesture)
        super.viewDidLoad()
        
    }
    var index = 0
    @IBAction func handleSwipe(_ sender: UISwipeGestureRecognizer) {
        var image = UIImage()
        switch sender.direction {
        case .left:
            if index == 0 {
                index = imgName.count - 1
            }
            else {
                index -= 1
            }
            
        case .right:
            if index == imgName.count - 1 {
                index = 0
            }
            else {
                index += 1
            }
            
        default:
            print("Have err")
        }
        image = UIImage(named: imgName[index])!
        foodImage.image = image
        }
}

