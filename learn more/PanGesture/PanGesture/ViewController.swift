//
//  ViewController.swift
//  PanGesture
//
//  Created by Luy Nguyen on 7/27/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var panGesture: UIPanGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func panGestureAction(_ sender: UIPanGestureRecognizer) {
        let vitri = sender.translation(in: view)
        
        sender.view?.transform = (sender.view?.transform.translatedBy(x: vitri.x, y: vitri.y))!
        sender.setTranslation(CGPoint.zero, in: view)
    }
    

}

