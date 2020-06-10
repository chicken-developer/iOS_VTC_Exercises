//
//  ViewController.swift
//  passingDataTest
//
//  Created by Nguyen Manh Quynh on 2/24/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import CoreData

struct Info{
    let id: String
    let stringinfo: String
}

class ViewController: UIViewController {

    @IBOutlet weak var firstNameTxtF: UITextField!
    @IBOutlet weak var lastNameTxtF: UITextField!
    @IBOutlet weak var textInfo: UITextField!
    @IBOutlet weak var id: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func updateUsingDelegate(_ sender: Any) {
        
    }
    @IBAction func updateUsingClosures(_ sender: Any) {
        
    }
    @IBAction func addInfo(_ sender: Any) {
        let firstName = firstNameTxtF.text ?? ""
                 let lastName = lastNameTxtF.text ?? ""
                 if firstName == "" || lastName == "" {
                     return
                 }
                 saveInfo(firstName: firstName, lastName: lastName)
             }
    }
    
       func saveInfo(firstName : String, lastName: String) {
           guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
               return
           }
           
           let manageContext = appDelegate.persistentContainer.viewContext
           let entity = NSEntityDescription.entity(forEntityName: "Person", in: manageContext)!
           let person = NSManagedObject(entity: entity, insertInto: manageContext)
           person.setValue(firstName, forKeyPath: "age")
           person.setValue(lastName, forKeyPath: "name")
           
           appDelegate.saveContext()
           
       }



