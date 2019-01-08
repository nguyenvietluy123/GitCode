//
//  ViewController.swift
//  InsertAndDeleteRows
//
//  Created by Luy Nguyen on 7/22/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    var videos: Array<String> = ["What the hell", "Tell me your name", "Shape of you"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func addButton(_ sender: Any) {
        videos.append(textField.text!)
        let indexPath = IndexPath(row: videos.count - 1, section: 0)
        
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()

        textField.text = ""
        tableView.endEditing(true)
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ViewControllerCell", for: indexPath) as! ViewControllerCell
        cell.title.text = videos[indexPath.item]
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            videos.remove(at: indexPath.row)

            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            tableView.endEditing(true)
        }
    }
    
}

