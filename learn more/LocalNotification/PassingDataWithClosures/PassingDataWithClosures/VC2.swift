//
//  VC2.swift
//  PassingDataWithClosures
//
//  Created by Luy Nguyen on 8/28/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

class VC2: UIViewController {
    @IBOutlet weak var textField: UITextField!
    
    var passData: ((_ data: String) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func popToVC1(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        passData?(textField.text!)
        
    }
    
    
    
}
