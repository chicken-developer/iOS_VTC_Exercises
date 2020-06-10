//
//  ViewController.swift
//  usingFetchDataCore
//
//  Created by Nguyen Manh Quynh on 2/25/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    //MARK:Define Outlet
    @IBOutlet weak var InfoTableView: UITableView!
    
    //MARK: Create Variable
    private lazy var appDelegate = UIApplication.shared.delegate as! AppDelegate
    lazy var fetchResultsController: NSFetchedResultsController<NSManagedObject> = {
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "UserInfo")
        let sortDescriptor = NSSortDescriptor(key: "username", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        let fetchResultsController = NSFetchedResultsController<NSManagedObject>(fetchRequest: fetchRequest, managedObjectContext: managedContext, sectionNameKeyPath: nil, cacheName: nil)
        return fetchResultsController
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadAllInfo()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        InfoTableView.dataSource = self
        InfoTableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    //MARK: CoreData function
    func saveInCoreData(username: String, age: Int){
        let managedContext = appDelegate.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "UserInfo", in: managedContext) else{
            return
        }
        let user = NSManagedObject(entity: entity, insertInto: managedContext)
        user.setValue(username, forKey: "username")
        user.setValue(age, forKey: "age")
        appDelegate.saveContext()
    }
    
    func updateInCoreData(username: String, age: Int, user: NSManagedObject){
        let managedContext = appDelegate.persistentContainer.viewContext
        let usernameOld = user.value(forKey: "username") as? String ?? ""
        let ageOld = user.value(forKey: "age") as? Int ?? 0
        
        let predicate = NSPredicate(format: "name = %@ AND age = %i", usernameOld,ageOld)
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "UserInfo")
        fetchRequest.predicate = predicate
        do{
            let users = try managedContext.fetch(fetchRequest)
            for updateObject in users{
                updateObject.setValue(username, forKey: "username")
                updateObject.setValue(age, forKey: "age")
            }
            appDelegate.saveContext()
        }catch{
            print("Have err when update user:  \(error.localizedDescription)")
        }
    }
    
    func deleteFromCoreData(age: Int16){
        let managedContext = appDelegate.persistentContainer.viewContext
        let predicate = NSPredicate(format: "age = %i", age)
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "UserInfo")
        fetchRequest.predicate = predicate
        do{
            let users = try managedContext.fetch(fetchRequest)
            for user in users{
                managedContext.delete(user)
                appDelegate.saveContext()
            }
        }catch{
            print("Have err when delete user: \(error.localizedDescription)")
        }
    }
    
    
    func addAlert(){
        let alert = UIAlertController(title: "Add new User", message: "Enter user info", preferredStyle: .alert)
        alert.addTextField(configurationHandler: {(usernameTxtF) in
            usernameTxtF.placeholder = "Enter name"
        })
        alert.addTextField(configurationHandler: {(ageTxtF) in
            ageTxtF.placeholder = "Enter Age"
        })
        let saveAction = UIAlertAction(title: "Save", style: .default) { [unowned self] action in
            guard let usernameTxt = alert.textFields?.first,
                let usernameSave = usernameTxt.text else {
                    return
            }
            guard let ageTxtF = alert.textFields?[1],
                let ageSave = ageTxtF.text else{
                    return
            }
            self.saveInCoreData(username: usernameSave, age: Int(ageSave)!)
        }
        let cancleAlert = UIAlertAction(title: "Cancle", style: .default)
        alert.addAction(saveAction)
        alert.addAction(cancleAlert)
        present(alert, animated: true)
        
    }
    
    func updateAlert(with user: NSManagedObject){
        let username = user.value(forKey: "username") as? String ?? ""
        let age = user.value(forKey: "age") as? Int ?? 0
        
        let alert = UIAlertController(title: "Update Info", message: "Enter valid name to update", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: {(usernameTxtF) in
            usernameTxtF.placeholder = "Enter Username"
            usernameTxtF.text = username
        })
        alert.addTextField(configurationHandler: {(ageTxtF) in
            ageTxtF.placeholder = "Age"
            ageTxtF.text = "\(age)"
        })
        
        
        let updateAction = UIAlertAction(title: "Update", style: .default) {
            [unowned self] action in
            guard let usernameTxtF = alert.textFields?[0],
                let usernameSave = usernameTxtF.text else {
                    return
            }
            guard let ageTxtF = alert.textFields?[1],
                let ageSave = ageTxtF.text else {
                    return
            }
            self.updateInCoreData(username: usernameSave, age: Int(ageSave)!, user: user)
        }
        let deleteAction = UIAlertAction(title: "Delete", style: .default){
            [unowned self] action in
            self.delete(age)
        }
        let cancleACtion = UIAlertAction(title: "Cancle", style: .cancel)
        alert.addAction(updateAction)
        alert.addAction(cancleACtion)
        alert.addAction(deleteAction)
        present(alert, animated:  true)
        //COde continues here at delete action
    }
    //MARK: Button Action
    @IBAction func addBtnAction(_ sender: Any) {
        addAlert()
    }
    
    @IBAction func deleteBtnAction(_ sender: Any) {
       
    }
}

//MARK: TableView Extension
extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = fetchResultsController.sections else {
            return 0
        }
        let sectionInfo = sections[section]
        return sectionInfo.numberOfObjects
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = InfoTableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as! TableViewCellController
        let user = fetchResultsController.object(at: indexPath)
        let username = user.value(forKey: "username") as? String ?? ""
        let age = user.value(forKey: "age") as? Int16 ?? 0
        cell.userNameLabel.text = username
        cell.ageLabel.text = "\(age)"
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        InfoTableView.deselectRow(at: indexPath, animated: true)
        print("Enter a row")
        let user = fetchResultsController.object(at: indexPath)
        updateAlert(with: user)
    }
    
}
//MARK: ViewController Extension
extension ViewController{
    
    func loadAllInfo(){
        fetchResultsController.delegate = self as? NSFetchedResultsControllerDelegate
        do{
            try fetchResultsController.performFetch()
        } catch{
            print(error)
        }
    }
    
    
}

extension ViewController: NSFetchedResultsControllerDelegate{
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        InfoTableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            print("Enter insert case")
            if let indexPath = newIndexPath{
                InfoTableView.insertRows(at: [indexPath], with: .fade)
            }
        case .delete:
            print("Enter delete case")
            if let indexPath = newIndexPath{
                InfoTableView.deleteRows(at: [indexPath], with: .fade)
            }
            
        default:
            print("Default")
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        InfoTableView.endUpdates()
    }
}

