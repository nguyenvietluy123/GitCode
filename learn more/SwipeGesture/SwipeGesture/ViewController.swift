//
//  ViewController.swift
//  SwipeGesture
//
//  Created by Luy Nguyen on 7/26/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var swipeGesture: UISwipeGestureRecognizer!
    @IBOutlet weak var imgView: UIImageView!
    
    var goc: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func swipeGestureAction(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .left{
            UIView.animate(withDuration: 0.3) {
                self.goc += 45
                self.imgView.layer.transform = CATransform3DMakeRotation(CGFloat(M_PI) * self.goc / 180, 0, 0, 1)
            }
        }else {
            UIView.animate(withDuration: 0.3) {
                self.goc -= 45
                self.imgView.layer.transform = CATransform3DMakeRotation(CGFloat(M_PI) * self.goc / 180, 0, 0, 1)
            }
        }
    }
    
}

