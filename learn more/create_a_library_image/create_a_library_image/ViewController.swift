//
//  ViewController.swift
//  create_a_library_image
//
//  Created by Luy Nguyen on 5/10/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imgHinh: UIImageView!
    
    let arrHinhAnh: Array<String> = ["photo1", "photo2", "photo3", "photo4", "photo5"]
    var index: Int = 0
    
    
    @IBAction func buttonBack(_ sender: Any) {
        index -= 1
        
        if index < 0 {
            index = arrHinhAnh.count - 1
        }
        
        imgHinh.image = UIImage(named: arrHinhAnh[index])
    }
    
    
    @IBAction func buttonNext(_ sender: Any) {
        index += 1
        
        if index == arrHinhAnh.count {
            index = 0
        }
        
        imgHinh.image = UIImage(named: arrHinhAnh[index])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

 


}

