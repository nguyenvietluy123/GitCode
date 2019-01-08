//
//  ViewController.swift
//  Create a Slide-In Menu
//
//  Created by Luy Nguyen on 8/25/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

struct Setting {
    var image: String?
    var title: String?
}

class HomeController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var item = [Setting(image: "earth", title: "Cai dat"), Setting(image: "friends", title: "Chon chia se")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //avoid fat code
    lazy var settingsLaucher: SettingsLaucher = {
        let launcher = SettingsLaucher()
        launcher.homeController = self
        return launcher
    }()
    
    @IBAction func handleMore(_ sender: Any) {
        //avoid fat code
        settingsLaucher.showSettings()
        }
    
}

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
        
        cell.setting = item[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        settingsLaucher.handleDismiss()
        
        let pushVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "push")
        navigationController?.pushViewController(pushVC, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


















