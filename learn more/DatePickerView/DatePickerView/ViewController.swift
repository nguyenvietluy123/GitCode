//
//  ViewController.swift
//  DatePickerView
//
//  Created by Luy Nguyen on 8/22/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    
    var datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.datePickerMode = .dateAndTime
        datePicker.addTarget(self, action: #selector(dateChange), for: .valueChanged)
        
        textField.inputView = datePicker
        
    }

    @objc func dateChange() {
        let dateFomatter = DateFormatter()
        dateFomatter.dateFormat = "MM/dd/yyyy"
        
        textField.text = dateFomatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    
    @IBAction func tapGestureAction(_ sender: Any) {
        view.endEditing(true)
    }
}

