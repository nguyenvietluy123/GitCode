//
//  ViewController.swift
//  MotionShake
//
//  Created by Luy Nguyen on 7/30/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    var y:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (time) in
            self.y += 15
            UIView.animate(withDuration: 0.5, animations: {
                self.imgView.layer.transform = CATransform3DMakeTranslation(0, self.y, 0)
            })
        }
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == UIEventSubtype.motionShake {
            y -= 15
            self.imgView.layer.transform = CATransform3DMakeTranslation(0, self.y, 0)
        }
    }



}

