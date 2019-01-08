//
//  AddContactVC.swift
//  ContactWithCoreData
//
//  Created by Luy Nguyen on 8/23/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit
import CoreData
class AddContactVC: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        if nameTextField.text == "" || phoneNumberTextField.text == "" {
            let alert = UIAlertController(title: "Alert", message: "Please type full information...!", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okButton)
            present(alert, animated: true, completion: nil)
        } else {
            if let contact = NSEntityDescription.insertNewObject(forEntityName: "Contact", into: context) as? Contact {
                contact.name = nameTextField.text
                contact.number = phoneNumberTextField.text
                
                
                self.dismiss(animated: true, completion: nil)
                do {
                    try context.save()
                } catch {
                    print("Save failed")
                }
            }
            
        }
    }
    

}
