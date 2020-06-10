//
//  TableTestViewController.swift
//  TestLoadingImageOnlinePerfomance
//
//  Created by Nguyen Manh Quynh on 12/27/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class TableTestViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
        
        
    }
}

extension TableTestViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCell
        if let imageURL = URL(string: Images[indexPath.row]) {
            if let imageData = try? Data(contentsOf: imageURL){
                cell.tbViewCell_Image.image = UIImage(data: imageData)
            }
        }
        return cell
    }
    
    
}
extension TableTestViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}
