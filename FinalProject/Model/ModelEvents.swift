//
//  ModelEvents.swift
//  FinalProject
//
//  Created by admin on 14/02/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
class ModelEvents{
    static let PostDataEvent = EventNotificationBase(eventName: "PostDataEvent")
    //        static let LoggingStateChangeEvent = EventNotificationBase(eventName: "LoggingStateChangeEvent")
    static let gpsUpdateEvent = StringEventNotificationBase<String> (eventName: "gpsUpdateEvent")
    static let loginEvent = StringEventNotificationBase<String>(eventName: "LoginEvent")
    
    private init(){}
}
