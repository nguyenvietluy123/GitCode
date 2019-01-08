//
//  ViewController.swift
//  PickerView
//
//  Created by Luy Nguyen on 7/31/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var arrString: Array<Array<String>> = [["IOS", "Anroid", "Swift", "JavaScript", "Json"], ["Hoang", "Truc", "Luy", "Thong", "Tuan"]]
    
    var arrImg: Array<Array<UIImage>> = [[#imageLiteral(resourceName: "photo_job"), #imageLiteral(resourceName: "stack_of_book"), #imageLiteral(resourceName: "photo_iphone"), #imageLiteral(resourceName: "photo_watch"), #imageLiteral(resourceName: "photo_guitar")], [#imageLiteral(resourceName: "photo_iphone"), #imageLiteral(resourceName: "photo_vehicle"), #imageLiteral(resourceName: "photo_iphone"), #imageLiteral(resourceName: "photo_mom_and_baby"), #imageLiteral(resourceName: "photo_guitar")]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Dan Tri"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        pickerView.selectRow(arrImg.count/2, inComponent: 0, animated: true)
        
    }

//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return arrString.count
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return arrString[component].count
//    }
    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return arrString[component][row]
//    }
    
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return arrImg.count
//    }
//
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//        let imgView = UIImageView()
//        imgView.image = arrImg[row]
//        imgView.frame = CGRect(x: 10.0, y: 10.0, width: 200, height: 100)
//        imgView.contentMode = .scaleAspectFit
//        return imgView
//    }
//
//    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
//        return 100
//    }
//
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        img.image = arrImg[row]
//    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrImg[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let m_view = UIView()
        m_view.frame = CGRect(x: 0, y: 0, width: pickerView.frame.width / 2, height: 200)
        
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true

        img.frame = CGRect(x: 0, y: 0, width: m_view.frame.width, height: 150)
        img.image = arrImg[component][row]
        
        let lbl = UILabel()
        lbl.frame = CGRect(x: 12, y: m_view.frame.height - 35, width: m_view.frame.width, height: 30)
        lbl.text = arrString[component][row]
        
        m_view.addSubview(img)
        m_view.addSubview(lbl)
        
        return m_view
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 200
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        img.image = arrImg[component][row]
        label.text = arrString[component][row]
    }
}

