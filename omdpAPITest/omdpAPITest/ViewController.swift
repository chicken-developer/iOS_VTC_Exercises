//
//  ViewController.swift
//  omdpAPITest
//
//  Created by Nguyen Manh Quynh on 12/18/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit
let API_URL = "http://www.omdbapi.com/?apikey=4e59db8e&s=batman"

struct Movie : Codable{
    var title: String
    var year : String
    var myimdbID : String
    var type : String
    var poster : String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case myimdbID = "imdbID"
        case type = "Type"
        case poster = "Poster"
        
    }
    
}
struct SearchResult : Codable{
    var Search : [Movie]
}

class ViewController: UIViewController {
    
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    var arrMovie : [Movie]?
    override func viewDidLoad() {
        super.viewDidLoad()
        requestAPI()
    }
    
    private func requestAPI(){
        print("Enter func")
        //_1
        dataTask?.cancel()
        
        http://www.omdbapi.com/?apikey=4e59db8e&s=batman
            //_2
            if var urlComponents = URLComponents(string: "http://www.omdbapi.com/"){
            urlComponents.query = "apikey=4e59db8e&s=batman"
            
            //_3
            guard let url = urlComponents.url else {
                return
            }
            //_4
            dataTask = defaultSession.dataTask(with: url, completionHandler: { (data, response, error) in
                //_5
                if let error = error{
                    print("Error: ", error.localizedDescription)
                } else if let data = data,
                    let response = response as? HTTPURLResponse,
                    response.statusCode == 200 {
                    print("Success! ")
                    do{
                        let object = try JSONDecoder().decode(SearchResult.self, from: data)
                        print("OK")
                        dump(object)
                    }catch let err{
                        print(err.localizedDescription)
                    }
                }
            })
        }
        //_7
        dataTask?.resume()
    }
    
}

