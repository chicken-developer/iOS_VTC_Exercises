//
//  ViewController.swift
//  btSwift_buoi15
//
//  Created by Nguyen Manh Quynh on 12/9/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

struct infoStruct {
    let title : String
    let description : String
}

class myListController: UIViewController {
    
    let  infoArr : [infoStruct] = [
        infoStruct(title: "Title 01",description: "Here is description for title 01"),
        infoStruct(title: "Title 02",description: "Here is description for title 02"),
        infoStruct(title: "Title 03",description: "Here is description for title 03"),
        infoStruct(title: "Title 04",description: "Here is description for title 04"),
        infoStruct(title: "Title 05",description: "Here is description for title 05"),
        infoStruct(title: "Title 06",description: "Here is description for title 06"),
        infoStruct(title: "Title 07",description: "Here is description for title 07")]
    @IBOutlet weak var myTableView: UITableView!
    
    
    
            override func viewDidLoad() {
                super.viewDidLoad()
                myTableView.dataSource = self
                myTableView.delegate = self
                
                // Do any additional setup after loading the view.
            }
            
            
        }
        
        extension myListController: UITableViewDataSource{
            
            public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return infoArr.count
            }
            
            public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = myTableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCell
                let  info : infoStruct = infoArr[indexPath.row]
                cell.titleLabelText.text = info.title
                cell.descriptionLabel.text = info.description
                return cell
            }
            
            
        }
        extension myListController: UITableViewDelegate{
            
}
