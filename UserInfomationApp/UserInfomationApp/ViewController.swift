//
//  ViewController.swift
//  UserInfomationApp
//
//  Created by Nguyen Manh Quynh on 2/24/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import CoreData

struct Info {
    var age: Int
    var name: String
}
class ViewController: UIViewController {
    
    @IBOutlet weak var mytableView: UITableView!
    
    
    var infoList : [Info] = []
   
    //MARK: - Variables
        private lazy var appDelegate = UIApplication.shared.delegate as! AppDelegate
    //    private var arrayObject: [NSManagedObject] = []
        
        lazy var fetchResultsController: NSFetchedResultsController<NSManagedObject> = {
            let managedContext = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
            
            let sortDescriptor = NSSortDescriptor(key: "name", ascending: false)
            fetchRequest.sortDescriptors = [sortDescriptor]
            
            let fetchedResultsController = NSFetchedResultsController<NSManagedObject>(fetchRequest: fetchRequest, managedObjectContext: managedContext, sectionNameKeyPath: nil, cacheName: nil)
            
            return fetchedResultsController
        }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadAllPerson()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        mytableView.delegate = self
        mytableView.dataSource = self
        loadInfoCoreData()
        // Do any additional setup after loading the view.
    }
    func loadAllPerson(){
           
           fetchResultsController.delegate = self
           do{
               try fetchResultsController.performFetch()
           }catch{
               print(error)
           }
       }
    @IBAction func deleteBtn(_ sender: Any) {
        deleteAlert(Title: "Delete", Message: "Delete this user? ")
    }
    
    @IBAction func addBtn(_ sender: Any) {
        let alertController = UIAlertController(title: "Alert", message: "Add user", preferredStyle: .alert)
                   alertController.addAction(UIAlertAction(title: "Add", style: .default, handler: { alert -> Void in
                       let nameTxtF = alertController.textFields![0] as UITextField
                       let ageTxtf = alertController.textFields![1] as UITextField
                       let currentName = nameTxtF.text ?? ""
                       let currentAge = Int(ageTxtf.text ?? "") ?? 0
                       self.infoList.append(Info(age: currentAge, name: currentName))
                       self.saveInfoCoreData(name: currentName, age: currentAge)
                   }))
                   
                   alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                   alertController.addTextField(configurationHandler: {(nameTxtF : UITextField!) -> Void in
                       nameTxtF.placeholder = "Enter Name"
                   })
                   alertController.addTextField(configurationHandler: {(ageTxtF : UITextField!) -> Void in
                       ageTxtF.placeholder = "Enter Age"
                   })
                   self.present(alertController, animated: true, completion: nil)
        updateInfoCoreData()
        
        
    }
    func addInfo(){
        
    }
    
    func deleteInfo(){
        
    }
    
    func updateInfo(){
         updateAlert(Title: "Update Info", Message: "Enter Info")
    }
    
    
    func loadInfoCoreData(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let manageContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "PersonInfo")
        
        do {
            let person = try manageContext.fetch(fetchRequest)
            for per in person {
                let age = per.value(forKey: "age") as? Int ?? 0
                let name = per.value(forKey: "name") as? String ?? ""
                print(age, name)
            }
            
            
        }catch let err{
            print(err.localizedDescription)
        }
    }
        func saveInfoCoreData(name : String, age: Int) {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
            }
            
            let manageContext = appDelegate.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "PersonInfo", in: manageContext)!
            let person = NSManagedObject(entity: entity, insertInto: manageContext)
            person.setValue(age, forKeyPath: "age")
            person.setValue(name, forKeyPath: "name")
            
            appDelegate.saveContext()
            
        }
        
        
        func updateInfoCoreData(){
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
            }
            
            let manageContext = appDelegate.persistentContainer.viewContext
            let predicate = NSPredicate(format: "age = %@", "Person 2")
            //parameter 1: atribute name, 2: atribute value
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "PersonInfo")
            fetchRequest.predicate = predicate
            do {
                let person = try manageContext.fetch(fetchRequest)
                //            for item in person{
                //                let age = item.value(forKey: "age") as? String ?? ""
                //                print(age)
                //            }
                let updateObject = person.first
                updateObject?.setValue("Person 4", forKey: "age")
                updateObject?.setValue("Person 4", forKey: "name")
                appDelegate.saveContext()
                
            }catch let err{
                print(err.localizedDescription)
            }
            
        }
        
        func deleteInfoCoreData(){
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
            }
            
            let manageContext = appDelegate.persistentContainer.viewContext
            let predicate = NSPredicate(format: "age = %@", "Person 4")
            //parameter 1: atribute name, 2: atribute value
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "PersonInfo")
            fetchRequest.predicate = predicate
            do {
                let person = try manageContext.fetch(fetchRequest)
                //            for item in person{
                //                let age = item.value(forKey: "age") as? String ?? ""
                //                print(age)
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
        
       
        
        func updateAlert(Title: String,Message: String) {
            let alertController = UIAlertController(title: Title, message: Message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Save", style: .default, handler: { alert -> Void in
                let nameTxtF = alertController.textFields![0] as UITextField
                let ageTxtf = alertController.textFields![1] as UITextField
                let currentName = nameTxtF.text ?? ""
                let currentAge = Int(ageTxtf.text ?? "") ?? 0
                self.infoList.append(Info(age: currentAge, name: currentName))
                self.mytableView.reloadData()
            }))
            
            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            alertController.addTextField(configurationHandler: {(nameTxtF : UITextField!) -> Void in
                nameTxtF.placeholder = "Enter New Name"
            })
            alertController.addTextField(configurationHandler: {(ageTxtF : UITextField!) -> Void in
                ageTxtF.placeholder = "Enter New Age"
            })
            self.present(alertController, animated: true, completion: nil)
        }
        
        func deleteAlert(Title: String,Message: String) {
            let alertController = UIAlertController(title: Title, message: Message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Delete", style: .default, handler: { alert -> Void in
                let ageTxtf = alertController.textFields![0] as UITextField
                let currentAge = Int(ageTxtf.text ?? "") ?? 0
                
                self.mytableView.reloadData()
            }))
            
            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            alertController.addTextField(configurationHandler: {(ageTxtF : UITextField!) -> Void in
                ageTxtF.placeholder = "Enter Age"
            })
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
    
    extension ViewController: UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return infoList.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = mytableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! TbViewCellController
            cell.nameLb.text = infoList[indexPath.row].name
            cell.ageLb.text = String(infoList[indexPath.row].age)
            return cell
            
        }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let currentInfo = infoList[indexPath.row]
            updateAlert(Title: "Update", Message: "Update")
            
        }
        
        
    }
    extension ViewController: UITableViewDelegate{
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 80
        }
    }

