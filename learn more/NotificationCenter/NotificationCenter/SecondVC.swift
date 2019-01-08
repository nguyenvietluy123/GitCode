//
//  SecondVC.swift
//  NotificationCenter
//
//  Created by Luy Nguyen on 8/24/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

let keyNotification = "myKey"

class SecondVC: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        NotificationCenter.default.addObserver(self, selector: #selector(doThisWhenNotify), name: NSNotification.Name(rawValue: keyNotification), object: nil)
  
    }
    
    @objc func doThisWhenNotify() {
        print("I've sent a spark!")
    }
    

    
    
    @IBAction func notifyButton(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: keyNotification), object: nil)
        label.text = "Notification completed"
    }
    
}
