//
//  SellingCell.swift
//  SearchBar
//
//  Created by Luy Nguyen on 5/24/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

class SellingCell: UITableViewCell {

    @IBOutlet weak var imageHinh: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var category: UILabel!

    func setup(image: UIImage, name: String, category: String){
        imageHinh.image = image
        lblName.text = name
        self.category.text = category
    }



}
