//
//  Model.swift
//  FinalProject
//
//  Created by admin on 14/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
class Model
{
    static let instance = Model()
    
    var modelFirebase: ModelFirebase = ModelFirebase()

  //  var modelSql: ModelSql = ModelSql()
    private init()
    {
   //     modelSql.connect()
       for i in 0...0{
        
            let ps = Post(id: String(i),productName: "productName" + String(i),catagory: "catagory" + String(i),city: "city" + String(i),price: "price" + String(i),rentDates: "rentDates" + String(i),moreDetails: "moreDetails" + String(i),avatar: "",phone:"phone" + String(i))
 
//            ps.productName =  String(i)
//            ps.catagory = String(i)
//            ps.city = String(i)
//            ps.rentDates = String(i)
//            ps.price = String(i)
//            ps.moreDetails = String(i)
            add(post: ps)
        }
        
        
        
    }
    //var data=[Post]()
    func add(post:Post){
        //data.append(post)
       // modelSql.add(post: post)
        modelFirebase.add(post:post)
    }
    
    func getAllPosts(callback:@escaping ([Post]?)->Void)
    {
      //  return modelSql.getAllPosts()
       // return modelFirebase.getAllPosts()
        modelFirebase.getAllPosts(callback: callback)
    }
    
}
