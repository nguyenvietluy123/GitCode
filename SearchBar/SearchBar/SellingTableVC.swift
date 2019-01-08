//
//  SellingTableVC.swift
//  SearchBar
//
//  Created by Luy Nguyen on 5/24/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

class SellingTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        setupAnimal()
    }
    
    var arrayData = [Animal]()
    var currentAnimalArray = [Animal]()
    
    private func setupAnimal () {
        arrayData.append(Animal(name: "Amber", category: .cat, image: "1"))
        arrayData.append(Animal(name: "Succe", category: .cat, image: "2"))
        arrayData.append(Animal(name: "Letme", category: .cat, image: "3"))
        arrayData.append(Animal(name: "Bull", category: .dog, image: "4"))
        arrayData.append(Animal(name: "Caitao", category: .dog, image: "5"))
        currentAnimalArray = arrayData
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        guard !searchText.isEmpty else {
            currentAnimalArray = arrayData
            tableView.reloadData()
            return
        }
        currentAnimalArray = arrayData.filter({ (animal) -> Bool in
            animal.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return currentAnimalArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = tableView.dequeueReusableCell(withIdentifier: "SellingCell") as? SellingCell else{
            return UITableViewCell()
        }
        item.setup(image: UIImage(named: currentAnimalArray[indexPath.item].imageHinh)!, name: currentAnimalArray[indexPath.item].name, category: currentAnimalArray[indexPath.item].category.rawValue)
        return item
     
    }
    
    


}

class Animal {
    let name: String
    let category: AnimalType
    let imageHinh: String
    
    init(name: String, category: AnimalType, image: String) {
        self.name = name
        self.category = category
        self.imageHinh = image
    }
}

enum AnimalType: String {
    case cat = "cat"
    case dog = "dog"
}
