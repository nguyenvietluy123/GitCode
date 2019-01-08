//
//  ViewController.swift
//  FetchContact
//
//  Created by Luy Nguyen on 8/22/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit
import Contacts

struct Infor {
    var contact: CNContact
}

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var contacts = [CNContact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.title = "Contacts"
        
        fetchContact()
    }

    func fetchContact() {
        
        let store = CNContactStore()
        
        store.requestAccess(for: .contacts) { (granted, error) in
            if error != nil {
                print(error ?? "")
            }
            
            let key = [CNContactGivenNameKey, CNContactPhoneNumbersKey]
            
            let request = CNContactFetchRequest(keysToFetch: key as [CNKeyDescriptor])
            
            if granted {
                do {
                    try store.enumerateContacts(with: request, usingBlock: { (contacts, PointerIfWantToStop) in
                        
                        self.contacts.append(contacts)
                        
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    })
                } catch {
                    print("Granted but have problem!")
                }
                
            }
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! Cell
        cell.name.text = contacts[indexPath.item].givenName
        cell.phoneNumber.text = contacts[indexPath.item].phoneNumbers.first?.value.stringValue
        
        return cell
    }
}

















