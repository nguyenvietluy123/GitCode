//
//  ViewController.swift
//  slider
//
//  Created by Luy Nguyen on 5/17/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /*cơ bản về slider
     
    @IBOutlet weak var sldGiaTri: UISlider!

    @IBAction func sld_Acion_GiaTri(_ sender: UISlider) {
//        print(sldGiaTri.value)
        print(sender.value)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        sldGiaTri.maximumValue = 100
        sldGiaTri.minimumValue = 10
        sldGiaTri.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        sldGiaTri.minimumTrackTintColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        sldGiaTri.maximumTrackTintColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        sldGiaTri.thumbTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

        sldGiaTri.setThumbImage(#imageLiteral(resourceName: "icon_heart"), for: UIControlState.normal)
        sldGiaTri.setThumbImage(#imageLiteral(resourceName: "icon_heart"), for: UIControlState.highlighted)
    }
 
     */
    
    // tạo ứng dụng phối màu
    @IBOutlet weak var sldRed: UISlider!
    @IBOutlet weak var sldGreen: UISlider!
    @IBOutlet weak var sldBlue: UISlider!
    @IBAction func sld_ChonMau(_ sender: UISlider) {
        
        view.backgroundColor = UIColor(red: CGFloat(sldRed.value), green: CGFloat(sldGreen.value), blue: CGFloat(sldBlue.value), alpha: 1)
    }
    
    

}
