//
//  ViewController.swift
//  savingData
//
//  Created by Nguyen Manh Quynh on 1/10/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class Animal : NSObject, NSCoding, NSSecureCoding {
    static var supportsSecureCoding: Bool {
        return true
    }
    
    required init?(coder: NSCoder) {
        self.name = coder.decodeObject(forKey: "animalName") as? String ?? ""
        self.age = coder.decodeObject(forKey: "animalAge") as? Int  ?? 0
        self.Flyable = coder.decodeObject(forKey: "animalFlyable") as? Bool ?? false
        self.LiveArea = coder.decodeObject(forKey: "animalLiveArea") as? String ?? ""
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.name, forKey: "animalName")
        coder.encode(self.age , forKey: "animalAge")
        coder.encode(self.Flyable, forKey: "animalFlyable")
        coder.encode(self.LiveArea, forKey: "animalLiveArea")
    }
    
    let name: String
    let age: Int
    let Flyable: Bool
    let LiveArea : String
    
    init(name: String, age: Int,Flyable: Bool, LiveArea: String ) {
        self.name = name
        self.age = age
        self.Flyable = Flyable
        self.LiveArea = LiveArea
    }
}

struct Vehical: Codable {
    var name : String
    var year : Int
}

class ViewController: UIViewController {
    
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var intTextField: UITextField!
    @IBOutlet weak var boolTextField: UITextField!
    
    
    let myStringArr = ["An","Binh","Cuong","Duong"]
    let myDict = [1:"One", 2:"Two", 3:"Three"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let value = UserDefaults.standard.value(forKey: "myText") as? String{
            myTextField.text = value
        }
        let intValue = UserDefaults.standard.integer(forKey: "myInt")
        intTextField.text = String(intValue)
        
    }
    
    @IBAction func saveClick(_ sender: Any) {
        let text = myTextField.text ?? ""
        if text == "" {
            return
        }
        let userDefault = UserDefaults.standard
        userDefault.set(text, forKey: "myText") // parameter 1 is value name, 2 is any key handle defind
        if let value = userDefault.value(forKey: "myText") as? String{
            myTextField.text = value
            
        }
        //    userDefault.set(nil, forKey: "myKey") // set null value, the key is not be delete
        //    userDefault.removeObject(forKey: "myKey") // remove the key & value
        
        
        let myInt = Int(intTextField.text ?? "0") ?? 0
        if myInt == 0{
            return
        }
        userDefault.set(myInt, forKey: "myInt")
        let intValue = userDefault.integer(forKey: "myInt")
        intTextField.text = String(intValue)
        
        userDefault.set(myStringArr, forKey: "MyStringArray")
        let stringArr = userDefault.array(forKey: "MyStringArray") //as? [String]
        
        userDefault.set(myDict, forKey: "myDictionary")
        let dict = userDefault.dictionary(forKey: "myDictionary")
        //  print(dict)
        
    }
    
    @IBAction func printInfo(_ sender: Any) {
        let userDefault = UserDefaults.standard
        let animal = Animal(name: "Gau Truc", age: 40, Flyable: false, LiveArea:"Trung Quoc")
  let animalData = try! NSKeyedArchiver.archivedData(withRootObject: animal, requiringSecureCoding: true)
  //      let animalJsonData = try! JSONEncoder().encode(animal)
        userDefault.set(animalData, forKey: "AnimalKey")
        
        guard let newAnimalData = userDefault.data(forKey: "AnimalKey") else {
            return
        }
 // let newAnimal = try! JSONDecoder().decode(Animal.self, from: animalJsonData)
        guard let newAnimal = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(newAnimalData) else{return}
        print(newAnimal)
    }
    
    
    @IBAction func printInfo2(_ sender: Any) {
        let userDefault = UserDefaults.standard
        let car = Vehical(name: "Bentley", year: 2020)
        let carData = try! JSONEncoder().encode(car)
        userDefault.set(carData , forKey: "carKey")
        if let returnData = userDefault.value(forKey: "carKey") as? Data{
            let car = try! JSONDecoder().decode(Vehical.self, from: returnData)
            print(car)
        }
    }
}

