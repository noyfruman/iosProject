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

}
