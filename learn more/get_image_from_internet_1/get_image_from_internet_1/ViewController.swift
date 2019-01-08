//
//  ViewController.swift
//  get_image_from_internet_1
//
//  Created by Luy Nguyen on 5/10/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageHinh: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url: URL = URL(string: "http://api.baongocstore.com/storage/products/A-2A.png_5ac8b3e0e5090.png")!
        do
        {
        let dulieu: Data = try Data(contentsOf: url)
            imageHinh.image = UIImage(data: dulieu)
        }
        catch
        {
            print("khong load duoc")
        }
    }


}

