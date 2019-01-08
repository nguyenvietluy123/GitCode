//
//  MessageVC.swift
//  add_a_bar_button_to_a_nagivation_bar
//
//  Created by Luy Nguyen on 5/6/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

@IBDesignable class MessageVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let messageButton = UIBarButtonItem(title: "Messages", style: .done, target: self, action: #selector(tapButton))
        self.navigationItem.leftBarButtonItem = messageButton
        
        let createGroupButton = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(tapButton))
        self.navigationItem.rightBarButtonItem = createGroupButton
    }
    
    
    @objc func tapButton(){
        print("you tap")
    }
}
