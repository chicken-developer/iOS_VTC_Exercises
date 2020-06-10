//
//  AddNoteViewController.swift
//  noteApp
//
//  Created by Nguyen Manh Quynh on 1/12/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import MapKit
import SQLite3

protocol AddNoteViewControllerDelegate: class {
    func didAddItem(with item: Note)
}


class AddNoteViewController: UIViewController {
    
    @IBOutlet weak var clearBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var titleTxtF: UITextField!
    @IBOutlet weak var descriptionTxtView: UITextView!
    @IBOutlet weak var dateCreateTxtF: UILabel!
    @IBOutlet weak var locationString: UITextField!
    @IBOutlet weak var myMapView: MKMapView!
    
    
    var showNote : Note?
    let KeyForUserDefaults = "myKey"
    let locationManager = CLLocationManager()
    var mydb: OpaquePointer?
    
    weak var delegate: AddNoteViewControllerDelegate?
    
    func addNoteToSQL(noteNeedAdd : Note){
        
        //queryString
        //      Note(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT,description TEXT,dateCreate TEXT,locationLatitude INTEGER, locationLongitude INTEGER)"
        var statmentPointer : OpaquePointer?
        let queryString = "INSERT INTO Note (title, description, dateCreate, locationLatitude, locationLongitude) VALUES(?,?,?,?,?)"
        
        //prepare using Database
        if  sqlite3_prepare_v2(mydb, queryString, -1, &statmentPointer, nil) != SQLITE_OK{
            let errMsg = String(cString: sqlite3_errmsg(mydb))
            print("Error: ", errMsg)
        }
        if sqlite3_bind_text(statmentPointer, 1, noteNeedAdd.title, -1, nil) != SQLITE_OK{
            let errMsg = String(cString: sqlite3_errmsg(mydb))
            print("Error: ", errMsg)
        }
        if sqlite3_bind_text(statmentPointer, 2, noteNeedAdd.description, -1, nil) != SQLITE_OK{
            let errMsg = String(cString: sqlite3_errmsg(mydb))
            print("Error: ", errMsg)
        }
        
        if sqlite3_bind_text(statmentPointer, 3, noteNeedAdd.createDate.toString(dateFormat: "YYYY:MM:DD HH:mm"), -1, nil) != SQLITE_OK{
            let errMsg = String(cString: sqlite3_errmsg(mydb))
            print("Error: ", errMsg)
        }
        if sqlite3_bind_int(statmentPointer, 4, Int32(noteNeedAdd.locationLatitude)) != SQLITE_OK{
            let errMsg = String(cString: sqlite3_errmsg(mydb))
            print("Error: ", errMsg)
        }
        if sqlite3_bind_int(statmentPointer, 5, Int32(noteNeedAdd.locationLongitude)) != SQLITE_OK{
            let errMsg = String(cString: sqlite3_errmsg(mydb))
            print("Error: ", errMsg)
        }
        
        
        if sqlite3_step(statmentPointer) != SQLITE_DONE {
            let errMsg = String(cString: sqlite3_errmsg(mydb))
            print("Error: ", errMsg)
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let fileURL = try! FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("demodatabase.db") else {
            return}
        print(fileURL)
        
        if sqlite3_open(fileURL.path, &mydb) != SQLITE_OK{
            print("Have error when open database")
            return
        }
        // self.perform(#selector(addPinToMap), with: nil, afterDelay: 2)
        if let showNote = showNote {
            titleTxtF.text = showNote.title
            descriptionTxtView.text = showNote.description
            dateCreateTxtF.text = showNote.createDate.toString(dateFormat: "yyyy-MM-dd HH:mm")
            let noteLocation = CLLocationCoordinate2D(latitude: showNote.locationLatitude, longitude: showNote.locationLongitude)
            showCurrentLocation(location: noteLocation)
            
        }
        else{ showCurrentLocation() }
        
    }
    
    
    func showCurrentLocation(location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 10.772488, longitude: 106.700653)){
        let location = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        let myRegion = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        myMapView.setRegion(myRegion, animated: true)
        // myMapView.showsUserLocation = true // Add a blue point to show user know now location
        let mkPointLocation = MKPointAnnotation()
        mkPointLocation.coordinate = location
        mkPointLocation.title = "Some example text"
        myMapView.addAnnotation(mkPointLocation)
    }
    @IBAction func clearNote(_ sender: Any) {
        titleTxtF.text = ""
        descriptionTxtView.text = ""
        dateCreateTxtF.text = ""
        
    }
    @IBAction func saveNote(_ sender: Any) {
        
        //Get value
        let newdate = Date()
        let strDate = dateCreateTxtF.text ?? ""
        let newtitle = titleTxtF.text ?? ""
        if newtitle == ""{
            let alert =  UIAlertController(title: "Error", message: "Please enter valid title", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)        }
        
        let newdescription = descriptionTxtView.text ?? ""
        if newdescription == ""{
            let alert =  UIAlertController(title: "Error", message: "Please enter valid description", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)        }
        
        let newlatitude = myMapView.userLocation.coordinate.latitude //?? 10.773719
        let newlongitude = myMapView.userLocation.coordinate.longitude //?? 106.702777
        
        //Add new note
        if newtitle != "" && newdescription != "" && strDate == ""{
            //            let newNote = Note(id:5 ,title: newtitle, description: newdescription, createDate: newdate, locationLatitude: newlatitude, locationLongitude: newlongitude)
            //            addNoteToSQL(noteNeedAdd: newNote)
            
            let newNote = Note(id: 5, title: "newtitle", description: "newdescription", createDate: newdate, locationLatitude: 60.5434, locationLongitude: 170.534234)
            addNoteToSQL(noteNeedAdd: newNote)
            delegate?.didAddItem(with: newNote)
            self.navigationController?.popViewController(animated: true)
        }
            
            // Edit exist note
        else if newtitle != "" && newdescription != "" && strDate != ""{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
            let date = dateFormatter.date(from: strDate) ?? Date()
            let newNote = Note(id: 5, title: "newtitle", description: "newdescription", createDate: date, locationLatitude: 60.5434, locationLongitude: 170.534234)
            addNoteToSQL(noteNeedAdd: newNote)
            delegate?.didAddItem(with: newNote)
            self.navigationController?.popViewController(animated: true)
        }
        
        
    }
    
    
    @IBAction func findPlace(_ sender: Any) {
        let clGeoCoder = CLGeocoder()
        let locationName = locationString.text ?? ""
        clGeoCoder.geocodeAddressString(locationName) { (myPlaceMark, error) in
            guard let place = myPlaceMark?.first else {return}
            let location = place.location?.coordinate
            self.showCurrentLocation(location: location!)
            
        }
    }
}


extension AddNoteViewController : CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let userLocation = locations.first else {
            return
        }
        showCurrentLocation(location: userLocation.coordinate)
        
        //  addPinToMap()
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Have error when get location: ", error.localizedDescription)
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, didChange newState: MKAnnotationView.DragState, fromOldState oldState: MKAnnotationView.DragState) {
        if newState == .ending{
            let newLocation = myMapView.convert(view.center, toCoordinateFrom: view.superview)
            showCurrentLocation(location: newLocation)
            
        }
    }
}
extension AddNoteViewController : MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if let annotation = annotation as? MKPointAnnotation{
            let pinAnotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "myindetifier")
            pinAnotationView.pinTintColor = .black
            pinAnotationView.animatesDrop = true
            pinAnotationView.isDraggable = true
            // pinAnotationView.image = UIImage(named: "pinIcon.png")
            
            return pinAnotationView
        }
        return nil
    }
}
