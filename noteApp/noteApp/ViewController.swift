//
//  ViewController.swift
//  noteApp
//
//  Created by Nguyen Manh Quynh on 1/10/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import MapKit


struct Note : Codable {
    
    let title: String
    let description: String
    let createDate: Date
    let locationLatitude : Double
    let locationLongitude : Double
    
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
    
    
    @IBAction func addNewNotes(_ sender: Any) {
        self.performSegue(withIdentifier: "segueID", sender: nil)
    }
    
    
    
    func save(_ notes: [Note]) {
        let noteData = notes.map { try? JSONEncoder().encode($0) }
        
        UserDefaults.standard.set(noteData, forKey: KeyForUserDefaults)
    }
    
    func load() -> [Note] {
        guard let encodedData = UserDefaults.standard.array(forKey: KeyForUserDefaults) as? [Data] else {
            return []
        }
        
        return encodedData.map { try! JSONDecoder().decode(Note.self, from: $0) }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        myTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self

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


