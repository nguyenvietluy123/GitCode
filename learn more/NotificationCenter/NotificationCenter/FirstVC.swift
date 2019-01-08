//
//  ViewController.swift
//  NotificationCenter
//
//  Created by Luy Nguyen on 8/24/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit


class FirstVC: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Choose City
        NotificationCenter.default.addObserver(self, selector: #selector(setToVietNam), name: .VietNam, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(setToLao), name: .Lao, object: nil)
        
        
        //Send message
        NotificationCenter.default.addObserver(self, selector: #selector(doThisAfterNotified), name: NSNotification.Name(rawValue: keyNotification), object: nil)
    }

    @objc func setToVietNam() {
        cityLabel.text = "Viet Nam"
    }
    @objc func setToLao() {
        cityLabel.text = "Lao"
    }
    
    @objc func doThisAfterNotified() {
        label.text = "I'm feeling so good"
    }
 

}

