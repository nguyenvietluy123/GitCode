//
//  SellingTableVC.swift
//  autolayout+tableview
//
//  Created by Luy Nguyen on 4/19/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

class SellingTableVC: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    var arrayData = ["meo", "cho", "gau", "su tu"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SellingCell") as! SellingCell
        let item = arrayData[indexPath.item]
        cell.setupCell(item)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
