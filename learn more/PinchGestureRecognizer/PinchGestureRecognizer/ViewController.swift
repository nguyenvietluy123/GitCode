//
//  ViewController.swift
//  PinchGestureRecognizer
//
//  Created by Luy Nguyen on 7/26/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

//    @IBAction func pinGestureAction(_ sender: Any) {
//        let pinch: UIPinchGestureRecognizer = sender as! UIPinchGestureRecognizer
//        print(pinch.scale)
//
//        //c1
////        imgView.transform = imgView.transform.scaledBy(x: pinch.scale, y: pinch.scale)
////        pinch.scale = 1
//
//        //c2 (bất cứ thèn nào gọi hàm này đều sẽ được truyền vào sender, imgView có class cha là View, view này sẽ đại diện cho đối tượng mà pinGesture kéo vào, ở đây là imgView)
//        pinch.view?.transform = (pinch.view?.transform.scaledBy(x: pinch.scale, y: pinch.scale))!
//        pinch.scale = 1
//    }
    @IBAction func pinchGestureAction(_ sender: UIPinchGestureRecognizer) {
        sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
        sender.scale = 1
    }
    
    


}

