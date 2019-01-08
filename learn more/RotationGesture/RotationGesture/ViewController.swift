//
//  ViewController.swift
//  RotationGesture
//
//  Created by Luy Nguyen on 7/26/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var switchButton: UISwitch!
    
    var timerTest: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func switchButtonAction(_ sender: Any) {
        guard let sw = sender as? UISwitch else { return }
        
        
        if sw.isOn{
            timerTest = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
                UIView.animate(withDuration: 1, animations: {
                    self.imgView.transform = self.imgView.transform.rotated(by: 0.2)
                })
                
            }
        }else {
            timerTest?.invalidate()
            timerTest = nil
        }
    }
    
    @IBAction func rotationGestureAction(_ sender: UIRotationGestureRecognizer) {
        sender.view?.transform = (sender.view?.transform.rotated(by: sender.rotation))!
        sender.rotation = 0
    }
    

}

