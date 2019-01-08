//
//  ViewController.swift
//  TapGestureRecognizer
//
//  Created by Luy Nguyen on 7/26/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func tapGestureAction(_ sender: Any) {
        guard let tap: UITapGestureRecognizer = sender as? UITapGestureRecognizer else { return }
        print(tap.location(in: view))
    
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "trang-tri-gam-cau-thang-12")
        img.frame.size = CGSize(width: 50, height: 50)
        img.center = tap.location(in: view)
        view.addSubview(img)
        
    }
}

