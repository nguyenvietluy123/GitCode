//
//  ViewController.swift
//  CreateToolbar
//
//  Created by Luy Nguyen on 9/7/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 30))
        
        let flexibleButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        let rightButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(callBackButton))
        
        toolBar.setItems([flexibleButton, rightButtonItem], animated: true)
        toolBar.sizeToFit()
        
        tf.inputAccessoryView = toolBar
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(callBackButton))
        self.view.addGestureRecognizer(tap)
    }

    
    @objc func callBackButton() {
        self.view.endEditing(true)
    }

}

