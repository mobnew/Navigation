//
//  model.swift
//  Navigation
//
//  Created by Alexey Kurazhov on 19.08.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

class model {
    
    let notificationCenter = NotificationCenter.default
    let secret = "123"

     public func checkWord(word: String) {
         if word == secret {
             let notification = Notification(name:  NSNotification.Name(rawValue: "ok"), object: nil, userInfo: nil)
             notificationCenter.post(notification)
         } else {
             let notification = Notification(name:  NSNotification.Name(rawValue: "wrong"), object: nil, userInfo: nil)
             notificationCenter.post(notification)
         }
     }
}
