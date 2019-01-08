//
//  CornerRadiusButton.swift
//  autolayout+tableview
//
//  Created by Luy Nguyen on 4/19/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

class CornerRadiusButton: UIButton {
    override func awakeFromNib() {
    super.awakeFromNib()
    self.layer.cornerRadius = 4
    self.layer.masksToBounds = true
    }
}
