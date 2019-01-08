//
//  RevealTableVC.swift
//  RevealViewController
//
//  Created by Luy Nguyen on 8/24/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

class RevealTableVC: UIViewController {

    var item = ["Home", "Message", "Games"]
    override func viewDidLoad() {
        super.viewDidLoad()

  
    }

  
}

extension RevealTableVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RevealTableCell") as! RevealTableCell
        cell.title.text = item[indexPath.item]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let revealVC: SWRevealViewController = self.revealViewController()
        
        let cell: RevealTableCell = tableView.cellForRow(at: indexPath) as! RevealTableCell
        
        if cell.title.text == "Home"{
            let messageVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC")
            let nav = UINavigationController(rootViewController: messageVC)
            revealVC.pushFrontViewController(nav, animated: true)
        } else {
            let messageVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MessageVC")
            let nav = UINavigationController(rootViewController: messageVC)
            revealVC.pushFrontViewController(nav, animated: true)
        }
    }
}











