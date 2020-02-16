//
//  Post.swift
//  FinalProject
//
//  Created by admin on 14/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import Firebase
class Post
{
    // static var id: String?
    var productName: String = ""
    var catagory: String = ""
    var city: String = ""
    var price: String = ""
    var rentDates: String = ""
    var moreDetails: String = ""
    var avatar:String = ""
    var phone:String = " "
    var email: String = ""
    var lastUpdate:Int64?
    static var userEmail : String = ""
    var postId:String?
    static var postID:String?
    static var numberOfPosts:Int = 0
    
    
    init(productName:String,catagory:String, city:String, price:String, rentDates:String, moreDetails:String, avatar:String, phone:String, email:String) {
        self.productName = productName
        self.catagory = catagory
        self.city=city
        self.price=price
        self.rentDates=rentDates
        self.moreDetails=moreDetails
        self.avatar = avatar
        self.phone = phone
        self.email = email //maybe to delete
    
        //self.postId = postId
    }
    
    
    init (json: [String:Any])
    {
        //        let id=json["id"] as! String?
        //        self.init(json:id)
        self.productName = json["productName"] as! String;
        self.catagory = json["catagory"] as! String;
        self.city = json["city"] as! String;
        self.price = json["price"] as! String;
        self.rentDates = json["rentDates"] as! String;
        self.moreDetails = json["moreDetails"] as! String;
        self.avatar = json["avatar"] as! String
        self.phone = json["phone"] as! String;
        self.email = Post.userEmail
        self.postId = Post.postID
        let ts = json["lastUpdate"] as! Timestamp
        lastUpdate = ts.seconds;
    }
    
    
    func toJson()->[String:Any]
    {
        var json = [String:Any]();
        // json["id"] = id;
        json["productName"] = productName;
        json["catagory"] = catagory;
        json["city"] = city;
        json["price"] = price;
        json["rentDates"] = rentDates;
        json["moreDetails"] = moreDetails;
        json["avatar"] = avatar;
        json["phone"] = phone;
        json["email"] = email;
        json["postId"] = postId
        json["lastUpdate"] = FieldValue.serverTimestamp()
        return json;
    }
    
    
    func setPostId(postID:String){
        self.postId = postID
    }
    
 }
