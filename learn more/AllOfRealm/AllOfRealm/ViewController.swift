//
//  ViewController.swift
//  AllOfRealm
//
//  Created by Luy Nguyen on 7/22/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit
import RealmSwift

class Person: Object {
    @objc dynamic var name = ""
}

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var person = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
//        add_person()
        query_person()
    }
    
    func add_person() {
        let people = Person()
        people.name = "Andy"
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(people)

        }
    }
    
    func query_person() {
        let realm = try! Realm()
        try! realm.write {
            let all_people = realm.objects(Person.self)
            for each in all_people {
                person.append(each)
            }
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return person.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! Cell
        cell.title.text = person[indexPath.item].name
        return cell
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        self.person.removeAll()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            if (textField.text?.description.count)! > 0 {
                let realm = try! Realm()
                let predicate = NSPredicate(format: "name CONTAINS [c] %@", textField.text!)
                try! realm.write {
                    let filter_people = realm.objects(Person.self).filter(predicate)
                    for each in filter_people {
                        self.person.append(each)
                        self.tableView.reloadData()
                    }
                }
            }else {
                self.query_person()
            }
        }
        return true
    }
    
    
}

