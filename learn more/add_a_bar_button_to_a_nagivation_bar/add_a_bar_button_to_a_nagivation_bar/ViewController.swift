//
//  ViewController.swift
//  add_a_bar_button_to_a_nagivation_bar
//
//  Created by Luy Nguyen on 5/6/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tapButton))
        self.navigationItem.leftBarButtonItem = addButton
        
        let cameraButton_1 = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(tapButton))
        let cameraButton_2 = UIBarButtonItem(title: "camera", style: .done, target: self, action: #selector(tapButton))
        self.navigationItem.rightBarButtonItems = [cameraButton_1, cameraButton_2]
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }


    @objc func tapButton(){
        print("tapped")
    }
}

