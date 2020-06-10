//
//  ViewController.swift
//  noteApp
//
//  Created by Nguyen Manh Quynh on 1/10/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import MapKit
import SQLite3


struct Note : Codable {
    
    var id: Int64
    var title: String
    var description: String
    var createDate: Date
    var locationLatitude : Double
    var locationLongitude : Double
    
    
    //    init(title: String, description: String, createDate: Date, locationLatitude: Double, locationLongitude: Double) {
    //        self.title = title
    //        self.description = description
    //        self.createDate = createDate
    //        self.locationLatitude = locationLatitude
    //        self.locationLongitude = locationLongitude
    //    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    
    let KeyForUserDefaults = "myKey"
    var notes : [Note] = []
    var db : OpaquePointer?

    
    @IBAction func addNewNotes(_ sender: Any) {
        self.performSegue(withIdentifier: "segueID", sender: nil)
    }
    
    
    
    func readNoteFromSQL() -> [Note]{
        var stmt: OpaquePointer?
        var arrNote : [Note] = []
        var currentNote : Note?
        //Get Database
        if sqlite3_prepare(db, "SELECT * FROM Note", -1, &stmt, nil) != SQLITE_OK{
            let err = String(cString: sqlite3_errmsg(db)!)
            print("Error: ",err)
            return []
        }
        while sqlite3_step(stmt) == SQLITE_ROW{
            currentNote?.id = sqlite3_column_int64(stmt, 0)
            if let cTitle = sqlite3_column_text(stmt, 1){
                          let title = String(cString: cTitle)
                          currentNote?.title = title
                      }
                      if let cDescription = sqlite3_column_text(stmt, 2){
                          let description = String(cString: cDescription)
                          currentNote?.description = description
                      }
            
            if let cCurrentCreateDate = sqlite3_column_text(stmt, 3) {
                let createDate = String(cString: cCurrentCreateDate)
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
                currentNote?.createDate = dateFormatter.date(from: createDate) ?? Date()
            }
            
          
            currentNote?.locationLatitude = sqlite3_column_double(stmt, 4)
            currentNote?.locationLongitude = sqlite3_column_double(stmt, 5)
            arrNote.append(currentNote!)
        }
        return arrNote
    }
    
    override func viewDidAppear(_ animated: Bool) {
        myTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        
        guard let fileURL = try! FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("demodatabase.db") else {
                         return}
                     print(fileURL)
                     
                     if sqlite3_open(fileURL.path, &db) != SQLITE_OK{
                         print("Have error when open database")
                         return
                     }
                     let createStatement = "CREATE TABLE IF NOT EXISTS Note(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT,description TEXT,dateCreate TEXT,locationLatitude NUMERIC, locationLongitude NUMERIC)"
                     if sqlite3_exec(db, createStatement, nil, nil, nil) != SQLITE_OK{
                         let errMsg = String(cString: sqlite3_errmsg(db))
                         print("Error: ", errMsg)
                     }
        showNote()

    }
    
    func showNote(){
        let queryStatement = "SELECT * FROM Note"
        if sqlite3_exec(db, queryStatement, nil, nil, nil) != SQLITE_OK{
            print("Fail to select table")
            let err = String(cString: sqlite3_errmsg(db))
            print("System err:" , err)
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let vc = segue.destination as? AddNoteViewController {
            vc.showNote = sender as? Note
            vc.delegate = self
        }
    }
    
    
}


extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = myTableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as? TableViewCell else{
            return TableViewCell()
        }
        let currentNote = notes[indexPath.row]
        cell.titleLabel.text = currentNote.title
        cell.DescriptionLabel.text = currentNote.description
        cell.dateLabel.text = currentNote.createDate.toString(dateFormat: "yyyy-MM-dd HH:mm")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let currentNote = notes[indexPath.row]
        self.performSegue(withIdentifier: "segueID", sender: currentNote)
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension  Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
}

extension ViewController: AddNoteViewControllerDelegate {
    func didAddItem(with item: Note) {
        //1 get all array
        // reload data
        
        //2
        notes.append(item)
        
        myTableView.beginUpdates()
        myTableView.insertRows(at: [IndexPath(row: notes.count - 1, section: 0)], with: .automatic)
        myTableView.endUpdates()
    }
}


