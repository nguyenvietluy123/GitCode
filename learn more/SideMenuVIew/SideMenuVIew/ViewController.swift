//
//  ViewController.swift
//  SideMenuVIew
//
//  Created by Luy Nguyen on 8/24/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var leftBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var menuView: UIView!
    
    var isShowMenu: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leadingConstraint.constant = -200
        
        menuView.layer.shadowOpacity = 0.5
        menuView.layer.shadowRadius = 6
   
    }
    @IBAction func openMenu(_ sender: Any) {
        
        
    }
    
    @IBAction func leftBarAction(_ sender: Any) {
        if isShowMenu {
            UIView.animate(withDuration: 0.3) {
                self.leadingConstraint.constant = -200
                self.view.layoutIfNeeded()
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.leadingConstraint.constant = 0
                self.view.layoutIfNeeded()
            }
        }
        
        isShowMenu = !isShowMenu
    }
    
}

