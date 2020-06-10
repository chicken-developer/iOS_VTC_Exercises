//
//  LoadFirst_MainVC.swift
//  ShopCC
//
//  Created by Nguyen Manh Quynh on 1/21/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

protocol LoadFirst_MainVCDelegate: class {
    func didEnterValidName(name userName: String)
}

class LoadFirst_MainVC: UIViewController {
    
    @IBOutlet weak var nameTxtF: UITextField!
    @IBOutlet weak var goToShopBtn: UIButton!
    
    weak var delegate: LoadFirst_MainVCDelegate?
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
   
    @IBAction func goToShopAct(_ sender: Any) {
        let currentUserName = nameTxtF.text ?? ""
        if currentUserName == ""{
           showAlert(viewVC: self)
        }
        delegate?.didEnterValidName(name: currentUserName)
        self.performSegue(withIdentifier: "mainVCSegue", sender: self)
    }
    
    func showAlert(viewVC : UIViewController){
        let alert =  UIAlertController(title: "Umm....!", message: "If not enter a valid name, we will call you as Customer", preferredStyle: .alert)
        let cancelAct = UIAlertAction(title: "Try enter a name", style: .cancel, handler: nil)
        let gotoBuyAct = UIAlertAction(title: "Continue with system name", style: .default) { (UIAlertAction) in
            viewVC.performSegue(withIdentifier: "mainVCSegue", sender: nil)
        }
        alert.addAction(cancelAct)
        alert.addAction(gotoBuyAct)
        viewVC.present(alert, animated: true, completion: nil)
    }
}


