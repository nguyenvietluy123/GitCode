
//
//  Cell.swift
//  TableViewAdvanced
//
//  Created by Luy Nguyen on 7/31/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {

    var vc: ViewController?
    @IBOutlet weak var title: UILabel?
    
    func doSomething() {
        vc?.doSomething()
    }
   
}
