//
//  Post.swift
//  FinalProject
//
//  Created by admin on 14/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
class Post
{
    var id: String = ""
    var productName: String = ""
    var catagory: String = ""
    var city: String = ""
    var price: String = ""
    var rentDates: String = ""
    var moreDetails: String = ""
    var avatar:String = ""
    var phone:String = " "

    init(id:String, productName: String, catagory: String, city:String,price:String,rentDates:String,moreDetails:String,avatar:String,phone:String)
    {
        self.id = id;
        self.productName = productName;
        self.catagory = catagory;
        self.city = city;
        self.price = price;
        self.rentDates = rentDates;
        self.moreDetails=moreDetails;
        self.avatar=avatar;
        self.phone=phone;
        
    }
    init (json:[String:Any]){
        self.id = json["id"] as! String;
        self.productName = json["productName"] as! String;
        self.catagory = json["catagory"] as! String;
        self.city = json["city"] as! String;
        self.price = json["price"] as! String;
        self.rentDates = json["rentDates"] as! String;
        self.moreDetails = json["moreDetails"] as! String;
        self.avatar = json["avatar"] as! String
        self.phone = json["phone"] as! String;
    }
    
    func toJson()->[String:String]
    {
        var json = [String:String]();
        json["id"]=id
        json["productName"] = productName;
        json["catagory"] = catagory;
        json["city"] = city;
        json["price"] = price;
        json["rentDates"] = rentDates;
        json["moreDetails"] = moreDetails;
        json["avatar"] = avatar;
        json["phone"] = phone;
        return json;
    }
    
}
