//
//  Cell.swift
//  Create a Slide-In Menu
//
//  Created by Luy Nguyen on 8/25/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

class Cell: UICollectionViewCell {
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.darkGray : UIColor.white
            title.textColor = isHighlighted ? UIColor.white : UIColor.darkGray
            image.tintColor = isHighlighted ? UIColor.white : UIColor.darkGray
        }
    }
    
    var setting: Setting? {
        didSet {
            title.font = UIFont.systemFont(ofSize: 13)
            title.text = setting?.title
            
            image.tintColor = UIColor.darkGray
            image.image = UIImage(named: (setting?.image)!)?.withRenderingMode(.alwaysTemplate)
        }
    }
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var image: UIImageView!
    
}
