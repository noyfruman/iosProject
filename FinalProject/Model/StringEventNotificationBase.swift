//
//  StringEventNotificationBase.swift
//  FinalProject
//
//  Created by admin on 14/02/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
class StringEventNotificationBase<T>{
    let eventName:String
    init(eventName:String) {
        self.eventName=eventName;
    }
    func observe(callback: @escaping(T)-> Void){
        NotificationCenter.default.addObserver(forName: NSNotification.Name(eventName), object: nil, queue: nil){
            (data) in
            let strData:T = data.userInfo! ["data"] as! T
            callback(strData)
        }
    }
    func post(data : T){// in eliav project is:post //post is to transmit the event
        NotificationCenter.default.post(name: NSNotification.Name(eventName),object: self, userInfo: ["data":data])
        
    }
    
}
