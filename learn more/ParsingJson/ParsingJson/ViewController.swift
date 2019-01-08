//
//  ViewController.swift
//  ParsingJson
//
//  Created by Luy Nguyen on 7/25/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit
struct Website_Description: Decodable {
    var name: String
    var description: String
    var courses: [Course]
}

struct Course: Decodable{
    var id: Int
    var name: String
    var link: String
    var image: String
    var numberOfLessons: Int
    
    
    //Swift 4.0
    private enum CodingKeys: String, CodingKey{
        case id, name, link
        case image = "imageUrl"
        case numberOfLessons = "number_of_lessons"
    }
}

class ViewController: UIViewController {
    var id = [Website_Description]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "http://api.letsbuildthatapp.com/jsondecodable/website_description"
        
        guard let url: URL = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                do {
                    let websiteDescription = try JSONDecoder().decode(Website_Description.self, from: data)
                    print(websiteDescription.name, websiteDescription.description)
                    
                    self.id = [websiteDescription]
                    print(self.id)
                    //                let course = try JSONDecoder().decode([Course].self, from: data)
                    //                print(course[1].id)
                }
                catch let stringErr {
                    print("json Error:", stringErr)
                }
            }
            
            }.resume()
        
    }
    
    
    
}



