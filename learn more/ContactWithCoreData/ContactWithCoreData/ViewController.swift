//
//  ViewController.swift
//  ContactWithCoreData
//
//  Created by Luy Nguyen on 8/23/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var contacts = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        clear()
        
    }
    
    func clear() {
        do {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Contact")
            let results = try context.fetch(request) as! [NSManagedObject]
            for result in results {
                context.delete(result)
                try (context.save())
            }
            
        } catch {
            print("err")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        fetchContact()
        
    }
    
    func fetchContact() {
        do {
            contacts = try context.fetch(Contact.fetchRequest()) as! [Contact]
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {
            print("Fetch Error")
        }
        
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! Cell
        cell.name.text = contacts[indexPath.item].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let watchContactVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WatchContactVC") as! WatchContactVC
        watchContactVC.contact = contacts[indexPath.item]
        navigationController?.pushViewController(watchContactVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            contacts.remove(at: indexPath.item)

            let person = contacts[indexPath.item]
            self.context.delete(person)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
}









