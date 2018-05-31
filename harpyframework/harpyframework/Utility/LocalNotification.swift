//
//  LocalNotification.swift
//  harpyframework
//
//  Created by Pham Trung Nguyen on 5/30/18.
//  Copyright © 2018 SPJ. All rights reserved.
//

import UIKit
import UserNotifications

public class LocalNotification: NSObject, UNUserNotificationCenterDelegate {
    public static func registerForLocalNotification(on application: UIApplication) {
        if (UIApplication.instancesRespond(to: #selector(UIApplication.registerUserNotificationSettings(_:)))) {
            let notificationCategory: UIMutableUserNotificationCategory = UIMutableUserNotificationCategory()
            notificationCategory.identifier = "NOTIFICATION_CATEGORY"
            // Register
            application.registerUserNotificationSettings(UIUserNotificationSettings(types:[.sound, .alert, .badge], categories: nil))
        }
    }
    
    public static func dispatchLocalNotification(with title: String, body: String, userInfo: [AnyHashable: Any]? = nil, at date:Date) {
        if #available(iOS 10.0, *) {
            let content = UNMutableNotificationContent()
            content.title = title
//            content.subtitle = "Do you know?"
            content.body = body
            content.badge = 1
            //            content.categoryIdentifier = "Nixforest"
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
            let request = UNNotificationRequest(identifier: "timerDone", content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request, withCompletionHandler: {
                error in
//                print(error.debugDescription as Any)
            })
        } else {
            let notification = UILocalNotification()
            notification.fireDate = date
            if #available(iOS 8.2, *) {
                notification.alertTitle = title
            } else {
                // Fallback on earlier versions
            }
            notification.alertBody = body
            if let info = userInfo {
                notification.userInfo = info
            }
            notification.soundName = UILocalNotificationDefaultSoundName
            UIApplication.shared.scheduleLocalNotification(notification)
        }
        print("WILL DISPATCH LOCAL NOTIFICATION AT ", CommonProcess.getTimeString(date: date))
    }
}
