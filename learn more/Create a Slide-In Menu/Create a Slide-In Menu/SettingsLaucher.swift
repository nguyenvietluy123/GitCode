//
//  SettingsLaucher.swift
//  Create a Slide-In Menu
//
//  Created by Luy Nguyen on 8/25/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

//avoid fat code
class SettingsLaucher: NSObject {
    
    let blackView = UIView()
    
    var homeController = HomeController()
    
    func showSettings() {
        
        guard let collectionView = homeController.collectionView else { return }
        
        if let window = UIApplication.shared.keyWindow {
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            blackView.frame = window.frame
            blackView.alpha = 0
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            window.addSubview(blackView)
            window.addSubview(collectionView)
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.blackView.alpha = 1
                
                let height: CGFloat = collectionView.frame.height
                let y = self.homeController.view.frame.height - height
                collectionView.frame = CGRect(x: 0, y: y, width: collectionView.frame.width, height: collectionView.frame.height)
                
            }, completion: nil)
        }
    }
    
    @objc func handleDismiss() {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            guard let collectionView = self.homeController.collectionView else { return }
            
            self.blackView.alpha = 0
            
            collectionView.frame = CGRect(x: 0, y: self.homeController.view.frame.height, width: collectionView.frame.width, height: collectionView.frame.height)
            
        }, completion: nil)

    }

    
    override init() {
        super.init()
    }
}
