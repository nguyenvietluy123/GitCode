//
//  ViewController.swift
//  DemoCoreData
//
//  Created by Luy Nguyen on 7/22/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func addButton(_ sender: Any) {
        guard let enteredText = textField?.text else {
            return
        }
        
        if enteredText.isEmpty ||  textField?.text == "Type anything..."{
            
            let alert = UIAlertController(title: "Please Type Something", message: "Your entry was left blank.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default) { action in
                
            })
            
            self.present(alert, animated: true, completion: nil)
            
        } else {
            guard let entryText = textField.text else{
                return
            }
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let newEntry = Person(context: context)
            newEntry.name = entryText
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            self.dismiss(animated: true, completion: nil)
        }
    }
}











