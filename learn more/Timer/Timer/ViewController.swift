//
//  ViewController.swift
//  Timer
//
//  Created by Luy Nguyen on 6/1/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer: Timer!
    var i: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(ViewController.Chay), userInfo: nil, repeats: true)
    }


    @objc func  Chay() {
        i += 1
        if i == 5 {
            timer.invalidate()
            timer = nil
        }
        print("chay ngay di")
    }
}

