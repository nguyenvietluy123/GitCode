//
//  ViewController.swift
//  LongPressGestureRecognizer
//
//  Created by Luy Nguyen on 7/30/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var LongPressGesture: UILongPressGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


    @IBAction func LongPressGestureAction(_ sender: Any) {
        let long = sender as! UILongPressGestureRecognizer
        if long.state == .began {
            print("dang nhan")
        }
    }
    
    
}

