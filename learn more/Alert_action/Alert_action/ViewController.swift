//
//  ViewController.swift
//  Alert_action
//
//  Created by Luy Nguyen on 5/10/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func button_ThongBao(_ sender: Any) {
        //tạo alert
        let alert: UIAlertController = UIAlertController(title: "Cảnh Báo", message: "Lỗi truy cập", preferredStyle: UIAlertControllerStyle.alert)
        
        
        // tạo textField
        alert.addTextField { (email) in
            email.placeholder = "nhập Email!"
        }
        alert.addTextField { (passwork) in
            passwork.placeholder = "nhập password"
            passwork.isSecureTextEntry = true
        }
        
        //tạo button
        let button_OK: UIAlertAction = UIAlertAction(title: "OK", style: .default) { (btn) in
            print("OK")
            
            let email: String = alert.textFields![0].text!
            let pass: String = alert.textFields![1].text!
            
            print(email, pass)
        }
        
        let button_Cancel: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { (btn) in
            print("ban da bam huy")
        }
        
        //thêm button
        alert.addAction(button_Cancel)
        alert.addAction(button_OK)
        
        
        present(alert, animated: true, completion: nil)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

