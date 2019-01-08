//
//  ViewController.swift
//  UITableviewCell_Button_With_Action
//
//  Created by Luy Nguyen on 7/25/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var item  = ["string", "momo", "nonon"]
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ViewCell") as! ViewCell
        cell.title.text = item[indexPath.item]
//        cell.cellDelegate = self
        
        //each button for each row
        cell.plusButton.tag = indexPath.item
        cell.plusButton.addTarget(self, action: #selector(test), for: UIControlEvents.touchUpInside)
        return cell
    }
    
    @objc func test(sender: UIButton){
        switch sender.tag {
        case 0:
            print("0")
        default:
            print("1")
        }
    }
    
    //many buttons in a row
//    func didSelectButton(_ tag: Int) {
//        print(tag)
//    }
}

