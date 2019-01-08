//
//  ViewController.swift
//  PhatSinhBongTuyet
//
//  Created by Luy Nguyen on 8/4/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func CreateFlowers(_ sender: Any) {
        var tgian = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .long)
        print(tgian)
        for _ in 0...100 {
            let x = Int(arc4random())%375
            let y = Int(arc4random())%667
            
            let bongTuyet = UIImageView()
            bongTuyet.frame = CGRect(x: x, y: y, width: 15, height: 15)
            bongTuyet.image = #imageLiteral(resourceName: "snow_flowers")
            view.addSubview(bongTuyet)
        }
    }
    
}

