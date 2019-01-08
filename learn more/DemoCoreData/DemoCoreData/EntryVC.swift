//
//  EntryVC.swift
//  DemoCoreData
//
//  Created by Luy Nguyen on 7/22/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit
import CoreData

class EntryVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var people = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetch()
    }
    
    func fetch() {
        do {
            //read data
//            people = try context.fetch(Person.fetchRequest())
//            print(people)
            
            //query data
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
//            request.predicate = NSPredicate(format: "name BEGINSWITH %@", "L")
            people = try context.fetch(request) as! [Person]
    
            //update data
//            for person in people {
//                if let result = person.value(forKey: "name") as? String{
//                    person.setValue(result + "s", forKey: "name")
//                    print(person)
//                }
//            }
            //update data
//            people[0].setValue("Luy2", forKey: "name")
//            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch{
            print("Can't Fetch Data")
        }
    }
    
}

extension EntryVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EntryCell") as! EntryCell
        
        cell.title.text = people[indexPath.item].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            people.remove(at: indexPath.item)
            
            let person = people[indexPath.item]
            self.context.delete(person)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
//     func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        let delete = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
//            // delete item at indexPath
//            let item = self.people[indexPath.row]
//            self.context.delete(item)
//            (UIApplication.shared.delegate as! AppDelegate).saveContext()
//
//            self.people.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//
//        }
//
//        let share = UITableViewRowAction(style: .default, title: "Share") { (action, indexPath) in
//            // share item at indexPath
//            print("Share")
//
//        }
//
//        return [delete,share]
//
//    }
    
    
}
