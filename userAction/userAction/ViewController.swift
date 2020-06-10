//
//  ViewController.swift
//  userAction
//
//  Created by Nguyen Manh Quynh on 12/6/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imgViewCode: UIImageView!
    @IBOutlet var longtap: UILongPressGestureRecognizer!
    lazy var codelongtap = UILongPressGestureRecognizer(target: self, action: #selector(codelongtapfunc))
    
    @IBOutlet var maintapoutlet: UITapGestureRecognizer!
    let imgName = ["0.jpg","1.jpg"]
    @IBOutlet var gestureRecognizer: UITapGestureRecognizer!
    @IBOutlet weak var myImgView: UIImageView!
    let img0 =  UIImage(named: "0.jpg")
    let img1 =  UIImage(named: "1.jpg")
    
    @objc func codelongtapfunc(){
        if codelongtap.state == .ended {
           if imgViewCode.image == img0{
                 imgViewCode.image = img1
            }
            else {
                 imgViewCode.image = img0
            }
            
        }
    }
    
    @IBOutlet var myswipe: UISwipeGestureRecognizer!
    @IBOutlet var pangesture: UIPanGestureRecognizer!
    @IBAction func panGesture(_ sender: UIPanGestureRecognizer) {
        if pangesture.state == .began {
            self.view.bringSubviewToFront(imgViewCode)
            let translation = sender.translation(in: self.view)
                   if let view = sender.view{
                       view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
                      //
                   }
                  sender.setTranslation(CGPoint.zero, in: self.view)
        }
       
    }
    
    @IBAction func pinchGesture(_ sender: UIPinchGestureRecognizer) {
        if sender.state == .changed{
            sender.view?.transform = ((sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!)
            sender.scale = 1.0
        }
    }
    
    @IBAction func swipe(_ sender: Any) {
        myswipe.direction == .
    }
    
    
    var lastRotation : CGFloat = 0
    @IBAction func rotation(_ sender: UIRotationGestureRecognizer) {
        var originRotation = CGFloat()
        if sender.state == .began{
            print("Start rotation")
            sender.rotation = lastRotation
            originRotation = sender.rotation
        }
        else if sender.state == .changed{
            print("Rotation Changing")
            let newRotation = sender.rotation + originRotation
            sender.view?.transform = CGAffineTransform(rotationAngle:  newRotation)
        }
        else if sender.state == .ended{
            print("Rotation end")
            lastRotation = sender.rotation
        }
    }
    
    @IBAction func longtap(_ sender: Any) {
        guard longtap.view != nil else { return }
                     if longtap.state == .ended {
                        if myImgView.image == img0{
                              myImgView.image = img1
                         }
                         else {
                              myImgView.image = img0
                         }
                         
                     }
    }
    @IBAction func maintap(_ sender: Any) {
        guard maintapoutlet.view != nil else { return }
              if maintapoutlet.state == .ended {
                 if myImgView.image == img0{
                       myImgView.image = img1
                  }
                  else {
                       myImgView.image = img0
                  }
                  
              }
    }
    @IBAction func tapgesture(_ sender: Any) {
      
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        codelongtap.minimumPressDuration = 0.5
        imgViewCode.addGestureRecognizer(codelongtap)
       
        // Do any additional setup after loading the view.
    }


}

