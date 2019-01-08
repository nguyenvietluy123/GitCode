//
//  DestinationVC.swift
//  NotificationCenter
//
//  Created by Luy Nguyen on 8/24/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

extension Notification.Name {
    static var VietNam = Notification.Name(rawValue: "VietNam")
    static var Lao = Notification.Name(rawValue: "Lao")
}

class DestinationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    @IBAction func chooseVietNam(_ sender: Any) {
        NotificationCenter.default.post(name: .VietNam, object: nil)
    }
    
    @IBAction func chooseLao(_ sender: Any) {
        NotificationCenter.default.post(name: .Lao, object: nil)
    }
    

}
