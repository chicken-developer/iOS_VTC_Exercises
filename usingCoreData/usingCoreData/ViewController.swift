//
//  ViewController.swift
//  usingCoreData
//
//  Created by Nguyen Manh Quynh on 1/15/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var firstNameTxtF: UITextField!
    
    @IBOutlet weak var lastNameTxtF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInfo()
        // Do any additional setup after loading the view.
        
        
    }
    
    @IBAction func updateInfoBtn(_ sender: Any) {
        updateInfo()
    }
    @IBAction func addInfo(_ sender: Any) {
        let firstName = firstNameTxtF.text ?? ""
        let lastName = lastNameTxtF.text ?? ""
        if firstName == "" || lastName == "" {
            return
        }
        saveInfo(firstName: firstName, lastName: lastName)
    }
    
    @IBAction func deleteBtn(_ sender: Any) {
        deleteInfo()
    }
    func saveInfo(firstName : String, lastName: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let manageContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "PersonInfo", in: manageContext)!
        let person = NSManagedObject(entity: entity, insertInto: manageContext)
        person.setValue(firstName, forKeyPath: "firstName")
        person.setValue(lastName, forKeyPath: "lastName")
        
        appDelegate.saveContext()
        
    }
    
    func loadInfo(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let manageContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "PersonInfo")
        
        do {
            let person = try manageContext.fetch(fetchRequest)
            for per in person {
                let firstName = per.value(forKey: "firstName") as? String ?? ""
                let lastName = per.value(forKey: "lastName") as? String ?? ""
                print(firstName, lastName)
            }
            
            
        }catch let err{
            print(err.localizedDescription)
        }
        
        
    }
    
    func updateInfo(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let manageContext = appDelegate.persistentContainer.viewContext
        let predicate = NSPredicate(format: "firstName = %@", "Person 2")
        //parameter 1: atribute name, 2: atribute value
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "PersonInfo")
        fetchRequest.predicate = predicate
        do {
            let person = try manageContext.fetch(fetchRequest)
//            for item in person{
//                let firstName = item.value(forKey: "firstName") as? String ?? ""
//                print(firstName)
//            }
            let updateObject = person.first
            updateObject?.setValue("Person 4", forKey: "firstName")
            updateObject?.setValue("Person 4", forKey: "lastName")
            appDelegate.saveContext()
            
        }catch let err{
            print(err.localizedDescription)
        }
        
    }
    
    func deleteInfo(){
         guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                    return
                }
                
                let manageContext = appDelegate.persistentContainer.viewContext
                let predicate = NSPredicate(format: "firstName = %@", "Person 4")
                //parameter 1: atribute name, 2: atribute value
                let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "PersonInfo")
                fetchRequest.predicate = predicate
                do {
                    let person = try manageContext.fetch(fetchRequest)
        //            for item in person{
        //                let firstName = item.value(forKey: "firstName") as? String ?? ""
        //                print(firstName)
        //            }
                    
                    guard let deleteObject = person.first else {
                        return
                    }
                    manageContext.delete(deleteObject)
                    appDelegate.saveContext()
                    
                }catch let err{
                    print(err.localizedDescription)
                }
                
    }
}

