//
//  EventNotificationBase.swift
//  FinalProject
//
//  Created by admin on 14/02/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
class EventNotificationBase {
    let eventName:String;
    init(eventName:String) {
        self.eventName=eventName;
    }
    func observe(callback: @escaping()-> Void){
        NotificationCenter.default.addObserver(forName: NSNotification.Name(eventName), object: nil, queue: nil){
            (data) in
            callback();
        }
    }
    func post(){// in eliav project is:post //post is to transmit the event
        NotificationCenter.default.post(name: NSNotification.Name(eventName),object: self, userInfo: nil)
        
    }
}
