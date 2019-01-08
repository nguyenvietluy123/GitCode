//
//  SellingCell.swift
//  autolayout+tableview
//
//  Created by Luy Nguyen on 4/19/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

class SellingCell: UITableViewCell {
    

    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func setupCell(_ item: String) {
        nameLabel.text = item
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}


