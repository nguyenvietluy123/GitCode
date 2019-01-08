//
//  ViewCell.swift
//  UITableviewCell_Button_With_Action
//
//  Created by Luy Nguyen on 7/25/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

protocol ViewCellDelegate: NSObjectProtocol {
    func didSelectButton(_ tag: Int)
}

class ViewCell: UITableViewCell {

    weak var cellDelegate: ViewCellDelegate?
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var plusButton: UIButton!
    @IBAction func clickButton(_ sender: UIButton) {
        cellDelegate?.didSelectButton(sender.tag)
    }
    

}
