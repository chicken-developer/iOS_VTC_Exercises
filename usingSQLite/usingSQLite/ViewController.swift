//
//  ViewController.swift
//  usingSQLite
//
//  Created by Nguyen Manh Quynh on 1/13/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import SQLite3

class ViewController: UIViewController {
    var db: OpaquePointer?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        guard let fileURL = try! FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("demodatabase.db") else {
            return}
        print(fileURL)
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK{
            print("have error when open database")
            return
        }
        let createStatement = "CREATE TABLE IF NOT EXISTS User(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER)"
        if sqlite3_exec(db, createStatement, nil, nil, nil) != SQLITE_OK{
            let errMsg = String(cString: sqlite3_errmsg(db))
            print("Error: ", errMsg)
        }
        
        
    }
    
    @IBAction func addUser(_ sender: Any) {
        //queryString
        var statmentPointer : OpaquePointer?
        let queryString = "INSERT INTO USER (name, age) VALUES(?,?)"
        
        //prepare using Database
        if  sqlite3_prepare_v2(db, queryString, -1, &statmentPointer, nil) != SQLITE_OK{
            let errMsg = String(cString: sqlite3_errmsg(db))
            print("Error: ", errMsg)
        }
        let name : NSString = "Nguyen Van A"
        let age = 10
        if sqlite3_bind_text(statmentPointer, 1, name.utf8String, -1, nil) != SQLITE_OK{
            let errMsg = String(cString: sqlite3_errmsg(db))
            print("Error: ", errMsg)
        }
        if sqlite3_bind_int(statmentPointer, 2, Int32(age)) != SQLITE_OK{
            let errMsg = String(cString: sqlite3_errmsg(db))
            print("Error: ", errMsg)
        }
        
        if sqlite3_step(statmentPointer) != SQLITE_DONE {
            let errMsg = String(cString: sqlite3_errmsg(db))
            print("Error: ", errMsg)
        }
        
        
    }
    
}

