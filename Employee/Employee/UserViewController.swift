//
//  ViewController.swift
//  Employee
//
//  Created by Nguyen Manh Quynh on 2/26/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import CoreData


class UserViewController: UIViewController {
    
    
   
  
    //MARK: Variable
    @IBOutlet weak var myTableView: UITableView!
    let Users: [User] = []
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
        
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        // Do any additional setup after loading the view.
    }

    func loadAllPersonInfo() {
            
            let manageContext = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<User>(entityName: "User")
            
            do {
               
                let arrayObject = try manageContext.fetch(fetchRequest)
                for item in arrayObject {
                    print(item.task?.count ?? 0)
                    print("\n")
                }
                
            } catch {
                print("Error loadAllPersonInfo: \(error.localizedDescription)")
            }
        }
        
        func loadAllTask() {
            let manageContext = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<Task>(entityName: "Task")
            
            do {
               
                let arrayObject = try manageContext.fetch(fetchRequest)
                
                print("Task count = \(arrayObject.count)")
                
            } catch {
                print("Error loadAllPersonInfo: \(error.localizedDescription)")
            }
        }
        
   
//MARK: Button action
    @IBAction func addUser(_ sender: Any) {
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let task1 = Task(context: managedContext)
        task1.taskID = 1
        task1.taskName = "Task 1"
        task1.taskDetail = "This is task 1 detail"
        
        let task2 = Task(context: managedContext)
        task2.taskID = 2
        task2.taskName = "Text 2"
        task2.taskDetail = "This is task 2 detail"
        
        let user  = User(context: managedContext)
        user.firstName = "F Name 1"
        user.lastName = "L Name 1"
        user.userId = 1
        
   //     user.
        appDelegate.saveContext()
    }
    
   
}

extension UserViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let UserCell = myTableView.dequeueReusableCell(withIdentifier: "userCellID") as! UserTableViewCellController
        let currentUser = Users[indexPath.row]
        UserCell.userIdLabel.text = String(currentUser.userId)
        UserCell.userPassportLabel.text = currentUser.passport?.number
        UserCell.userFirstnameLabel.text = currentUser.firstName
        UserCell.userLastnameLabel.text = currentUser.lastName
        UserCell.numberOfTaskLabel.text = "\(currentUser.task?.count ?? 0)"
        return UserCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "", sender: <#T##Any?#>)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
}
