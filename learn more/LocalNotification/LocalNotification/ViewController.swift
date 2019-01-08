//
//  ViewController.swift
//  LocalNotification
//
//  Created by Luy Nguyen on 8/24/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (didAllow, error) in
        
        }
        
    }


    @IBAction func action(_ sender: Any) {
        let content = UNMutableNotificationContent()
        content.title = "Title here"
        content.subtitle = "Subtitle here"
        content.body = "Body here"
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

        let request = UNNotificationRequest(identifier: "timerDone", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
}

