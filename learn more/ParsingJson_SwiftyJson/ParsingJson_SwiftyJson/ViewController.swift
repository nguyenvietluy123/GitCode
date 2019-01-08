//
//  ViewController.swift
//  ParsingJson_SwiftyJson
//
//  Created by Luy Nguyen on 8/22/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    var urlString = "http://api.letsbuildthatapp.com/jsondecodable/website_description"
    override func viewDidLoad() {
        super.viewDidLoad()

//        guard let url = URL(string: urlString) else { return }
//
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            do {
//                let json = try JSON(data: data!)
//
//                let coursesArray = json["courses"].arrayValue
//                print(coursesArray)
//
//                let idsOfCourse = json["courses"].arrayValue.map({$0["id"].stringValue})
//
//                print("Id of courses: \(idsOfCourse)")
//            } catch {
//                print(error)
//            }
//
//        }.resume()
        parseJson() {(name) in
            DispatchQueue.main.async {
                print(name)
            }
            
        }
    }
    
    func parseJson(completion: @escaping (String?) -> Void) {
        
        guard let url: URL = URL(string: urlString) else { return }
        
        let configuration = URLSessionConfiguration.ephemeral
        
        let session = URLSession(configuration: configuration)
        
        let task = session.dataTask(with: url) { (data, response, error) in
            do {
                guard let data = data else { return }
                let json = try JSON(data: data)
                
                let name = json["courses"].arrayValue.map({$0["id"].stringValue})
                
                let fetchName = json["name"].stringValue
                print(fetchName)
                completion(fetchName)
            } catch {
                print("error")
            }
            
            if error != nil {
                print(error ?? "")
            }
        }
        task.resume()
    }
    
    



}

