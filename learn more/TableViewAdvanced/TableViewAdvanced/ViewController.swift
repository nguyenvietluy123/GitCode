//
//  ViewController.swift
//  TableViewAdvanced
//
//  Created by Luy Nguyen on 7/31/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

struct Item {
    var isExpand: Bool
    var names : [String]
}

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    func doSomething() {
        print("You do that...")
    }
    
    var arrName: Array<Item> = [
        Item(isExpand: true, names: ["An", "Anh", "Aut"]),
        Item(isExpand: true, names: ["Bao", "Binh", "Bien", "Bup"]),
        Item(isExpand: true, names: ["Daddy", "Dendi", "Duke"])]

    override func viewDidLoad() {
        super.viewDidLoad()
       
        navigationItem.title = "Contact"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Show IndexPath", style: .plain, target: self, action: #selector(handleShowIndexPath))
        
    }
    
    var showIndexPath:Bool = false
    @objc func handleShowIndexPath() {
        var indexToReload = [IndexPath]()
        
        for section in arrName.indices {
            for index in arrName[section].names.indices {
                if arrName[section].isExpand {
                    let indexPath = IndexPath(item: index, section: section)
                    indexToReload.append(indexPath)
                }
            }
        }
        showIndexPath = !showIndexPath
        let animationStyle = showIndexPath ? UITableViewRowAnimation.left : .right
        tableView.reloadRows(at: indexToReload, with: animationStyle)
    }

    @objc func handleExpandClose(button: UIButton) {
        var indexPaths = [IndexPath]()
        
        let section = button.tag
        
        for index in arrName[section].names.indices {
            let indexPath = IndexPath(item: index, section: section)
            indexPaths.append(indexPath)
        }
        
        let isExpand = arrName[section].isExpand
        arrName[section].isExpand = !isExpand
        
        button.setTitle(isExpand ? "Open" : "Close", for: .normal)
        
//        arrName[section].names.removeAll()
        if isExpand {
            tableView.deleteRows(at: indexPaths, with: .fade)
        }else {
            tableView.insertRows(at: indexPaths, with: .fade)
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrName.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !arrName[section].isExpand {
            return 0
        }
        return arrName[section].names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! Cell
//        let cell2 = tableView.dequeueReusableCell(withIdentifier: "Cell2") as! Cell2
//        if indexPath.item == 0{
//            cell.title?.text = arrName[0].names[0]
//            return cell
//        }else {
//            cell2.title.text = arrName[0].names[1]
//            return cell2
//        }
        cell.doSomething()

        let name: String = arrName[indexPath.section].names[indexPath.item]

        if showIndexPath{
            cell.title?.text = "\(name), row: \(indexPath.row) , section: \(indexPath.section)"
        } else {
            cell.title?.text = name
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100)
        
        let lbl = UILabel()
        lbl.frame = CGRect(x: 12, y: 0, width: tableView.frame.width, height: 60)
        if section == 0 {
            lbl.text = "A"
        }else {
            lbl.text = section == 1 ? "B" : "C"
        }
        
        let btn = UIButton(type: .system)
        btn.setTitle("Close", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        btn.frame = CGRect(x: tableView.frame.width - 60, y: 0, width: 50, height: 60)
        btn.addTarget(self, action: #selector(handleExpandClose), for: .touchUpInside)
        btn.tag = section
        
        header.addSubview(lbl)
        header.addSubview(btn)
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    
}
