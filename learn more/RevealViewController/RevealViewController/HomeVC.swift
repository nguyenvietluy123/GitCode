//
//  HomeVC.swift
//  RevealViewController
//
//  Created by Luy Nguyen on 8/24/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak var openBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        openBarButton.target = self.revealViewController()
        openBarButton.action = Selector("revealToggle:")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
