//
//  ViewController.swift
//  ScreenEdgePanGesture
//
//  Created by Luy Nguyen on 7/27/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var screenEdgePanGesture: UIScreenEdgePanGestureRecognizer!
    
    @IBOutlet weak var uv: UIView!
    @IBOutlet weak var leftEdgeUV: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        leftEdgeUV.constant = -300

    }



    @IBAction func screenEdgePanGestureAction(_ sender: UIScreenEdgePanGestureRecognizer) {
        if sender.edges == .left && leftEdgeUV.constant == -300 {
            UIView.animate(withDuration: 1) {
                self.leftEdgeUV.constant += 300
                self.view.layoutIfNeeded()
            }
        }
        else if sender.edges == .right && leftEdgeUV.constant == 0 {
            UIView.animate(withDuration: 1) {
                self.leftEdgeUV.constant -= 300
                self.view.layoutIfNeeded()
            }
        }
    }
    
}

