//
//  WatchContactVC.swift
//  ContactWithCoreData
//
//  Created by Luy Nguyen on 8/23/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit
import CoreData

class WatchContactVC: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    
    var contact: Contact?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveBtn.isHidden = true
        
        setup()
        responseChange()
    }
    
    func setup () {
        guard let name = contact?.name, let number = contact?.number else {
            return
        }
        nameTextField.text = name
        phoneNumberTextField.text = number
    }
    
    @objc func textDidChange() {
        saveBtn.isHidden = false
    }
    func responseChange() {
        nameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        phoneNumberTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        do {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Contact")
            request.fetchLimit = 1
            if let name = contact?.name {
                request.predicate = NSPredicate(format: "name = %@", name)
            }
            let result = try context.fetch(request) as! [Contact]
            result[0].name = nameTextField.text
            result[0].number = phoneNumberTextField.text
            
            try (context.save())
        } catch {
            print("error")
        }
        
        navigationController?.popViewController(animated: true)
    }
    
}
