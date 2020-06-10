//
//  SecondViewController.swift
//  omdpAPITest
//
//  Created by Nguyen Manh Quynh on 12/20/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit
let STRING_API = "https://maps.googleapis.com/maps/api/geocode/json?latlng=10.802184,106.686711&output=json&key=AIzaSyD4S0Qu29xxQsOLCPzGBWacF_2ugvu0QoQ"

struct Location  : Codable{
    var lat : Double
    var lng : Double
}
struct Geometry : Codable{
    var location: Location
    var location_type: String
}

struct Resutls : Codable{
    var geometry : Geometry
    var place_id : String
}
struct JSonData: Codable{
    var results : [Resutls]
}
class SecondViewController: UIViewController {
    
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestAPI()
    }
    
    private func requestAPI(){
        dataTask?.cancel()
        
        if var urlComponents = URLComponents(string: "https://maps.googleapis.com/maps/api/geocode/json"){
            urlComponents.query = "latlng=10.802184,106.686711&output=json&key=AIzaSyD4S0Qu29xxQsOLCPzGBWacF_2ugvu0QoQ"
            guard let url = urlComponents.url else {return}
            
            dataTask = defaultSession.dataTask(with: url, completionHandler: { (data, response, error) in
                if let error = error{
                    print(error.localizedDescription)
                } else if let data = data,
                          let response = response as? HTTPURLResponse,
                          response.statusCode == 200{
                    print("OK! ")
                    do{
                        
                        let objType2 =  try JSONDecoder().decode(JSonData.self, from: data)
                        let result = objType2.results
                        let placeID = result.first?.geometry
                        print(placeID!)
                        //dump(objType2)
                        print("Success. ")
        
                        
                        } catch let err{
                        print(err.localizedDescription)
                    }
                }
                else { print("Err when create response")}
            })
        }
        dataTask?.resume()
    }
    
}
