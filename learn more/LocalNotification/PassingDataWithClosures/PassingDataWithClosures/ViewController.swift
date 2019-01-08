//
//  ViewController.swift
//  PassingDataWithClosures
//
//  Created by Luy Nguyen on 8/28/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue" {
            let vc2 = segue.destination as? VC2
            vc2?.passData = { [weak self] (data) in
                self?.titleLabel.text = data
            }
        }
    }
    

}

