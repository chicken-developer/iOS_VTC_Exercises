//
//  ViewController.swift
//  TestLoadingImage_ver02
//
//  Created by Nguyen Manh Quynh on 1/4/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    var Images : [String] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
       
        //Create Loading Image
        let file = "sourceFile.txt"
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(file)
            print(fileURL)
            
            do {
                let textSource = try String(contentsOf: fileURL, encoding: .utf8)
                let imageURLs = textSource.split { $0.isNewline }
                for imageURL in imageURLs {
                    Images.append(String(imageURL))
                }
                //print(Images[0])
            }
            catch let error
            {
                print(error.localizedDescription)
            }
        }
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = myTableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TableViewCell
        if let imageURL = URL(string: Images[indexPath.row]){
            if let imageData = try? Data(contentsOf: imageURL) {
                tableViewCell.imageView?.image = UIImage(data: imageData)
                tableViewCell.imageIndex.text = Images[indexPath.row]
            }
        }
        return tableViewCell
    }
    
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}

