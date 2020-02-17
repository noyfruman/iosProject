//
//  Model.swift
//  FinalProject
//
//  Created by admin on 14/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit
class Model
{
    static let instance = Model()
    var modelSql: ModelSql = ModelSql()
    
    var modelFirebase: ModelFirebase = ModelFirebase()
    private init()
    {}

    
    func add(post:Post){
        modelFirebase.add(post:post)
        // ModelEvents.PostDataNotification.notify();
    }
    
    func getAllPosts(callback:@escaping ([Post]?)->Void)
    {
        //get the local last update date.
        var lud = modelSql.getLastUpdateDate(name:"POST")
        let num = modelSql.getNumOfPosts(name: "POST")
        
        //get the record from firebase since the local last update date.
        modelFirebase.getAllPosts(since: lud) { (data) in
            
            //save the new records to the local db.
            
            //insert update to the local DB
            //var localLud: Int64 = 0;
            for post in data!
            {
                self.modelSql.addToDb(post: post)
                
                if (post.lastUpdate! > lud)
                {
                    lud=post.lastUpdate!;
                }
            }
            
            //update the post local last update date
            
            self.modelSql.setLastUpdateDate(name: "POST", lud: lud)
            self.modelSql.setNumOfPosts(num: data!.count + num, name: "POST")
            
            //get the complete post list
            let finalData = self.modelSql.getAllPostFromDb()
            callback(finalData)
        }
    }
    
    func getMyPosts(callback:@escaping ([Post]?)->Void){
        
        modelFirebase.getMyPosts(callback: callback)
    }
    
    
    
    
    func deleteMyPost(postID:String){
        modelFirebase.deleteMyPost(postID: postID)
        modelSql.delete(postId: postID)
    }
    
    func updateMyPost(postId:String, post:Post){
        modelFirebase.updateMyPost(postId: postId, post: post)
    }
    
    func saveImage(image: UIImage,callback: @escaping (String)->Void)
       {
           FirebaseStorage.saveImage(image: image, callback:  callback)
       }
    
    func CreateUser(user:User, callback: @escaping (String)->Void){
        
        modelFirebase.createUser(email: user.email, password: user.password, callback:callback)
        
    }
    
    func loginUser(user:User, callback: @escaping (String)->Void){
        modelFirebase.loginUser(email:user.email, password:user.password, callback: callback)
    }
    
    func loginUserwithOutCallback(user:User){
        
        modelFirebase.loginUserwithOutCallback(email: user.email, password: user.password)
        
    }
    
}
   
  
    
    


