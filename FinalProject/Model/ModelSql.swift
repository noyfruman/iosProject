//
//  ModelSql.swift
//  FinalProject
//
//  Created by admin on 15/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
class ModelSql
{
    var database: OpaquePointer? = nil
//    static let instance = ModelSql()
    
     init() {
        let dbFileName = "database2.db"
        if let dir = FileManager.default.urls(for: .documentDirectory, in:
            .userDomainMask).first{
            let path = dir.appendingPathComponent(dbFileName)
            print(path.absoluteString)
            print(path)
            if sqlite3_open(path.absoluteString, &database) != SQLITE_OK {
                print("Failed to open db file: \(path.absoluteString)")
                return
            }
        }
        create();
    }
    
    
//    deinit{
//        sqlite3_close_v2(database)
//    }
    
     func create(){
        var errormsg: UnsafeMutablePointer<Int8>? = nil
        
       // var res=sqlite3_exec(database, "DROP TABLE POST", nil, nil, &errormsg);
        
       var res = sqlite3_exec(database, "CREATE TABLE IF NOT EXISTS POST(POSTKEY TEXT PRIMARY KEY, PRODUCTNAME TEXT, CATAGORY TEXT, CITY TEXT, PRICE TEXT ,RENTDATES TEXT,MOREDETAILS TEXT, AVATAR TEXT, PHONE TEXT, EMAIL TEXT)", nil, nil, &errormsg);
             if(res != 0){
                 print("error creating table");
                 return
             }
        
       res = sqlite3_exec(database, "CREATE TABLE IF NOT EXISTS LAST_UPDATE_DATE(NAME TEXT PRIMARY KEY, LUD DOUBLE)", nil, nil, &errormsg);
        if(res != 0){
            print("error creating table");
            return
        }
        res = sqlite3_exec(database, "CREATE TABLE IF NOT EXISTS NUM_OF_POSTS(NAME TEXT PRIMARY KEY, NUMBER INT)", nil, nil, &errormsg);
        if(res != 0){
            print("error creating table");
            return
        }
        
    }
    
    func addToDb (post:Post){ //like addPost
        var sqlite3_stmt: OpaquePointer? = nil
        if (sqlite3_prepare_v2(database,"INSERT OR REPLACE INTO POST(POSTKEY, PRODUCTNAME,CATAGORY, CITY,PRICE,RENTDATES,MOREDETAILS,AVATAR, PHONE, EMAIL) VALUES (?,?,?,?,?,?,?,?,?,?);",-1,&sqlite3_stmt,nil) == SQLITE_OK){
            let postId = post.postId!.cString(using: .utf8)
            let productName = post.productName.cString(using: .utf8)
            let catagory = post.catagory.cString(using: .utf8)
            let city = post.city.cString(using: .utf8)
            let price = post.price.cString(using: .utf8)
            let rentDates = post.rentDates.cString(using: .utf8)
            let moreDetails = post.moreDetails.cString(using: .utf8)
            let avatar = post.avatar.cString(using: .utf8)
            let phone = post.phone.cString(using: .utf8)
            let email = post.email.cString(using: .utf8)

            
            sqlite3_bind_text(sqlite3_stmt, 1, postId,-1,nil);
            sqlite3_bind_text(sqlite3_stmt, 2, productName,-1,nil);
            sqlite3_bind_text(sqlite3_stmt, 3, catagory,-1,nil);
            sqlite3_bind_text(sqlite3_stmt, 4, city,-1,nil);
            sqlite3_bind_text(sqlite3_stmt, 5, price,-1,nil);
            sqlite3_bind_text(sqlite3_stmt, 6, rentDates,-1,nil);
            sqlite3_bind_text(sqlite3_stmt, 7, moreDetails,-1,nil);
            sqlite3_bind_text(sqlite3_stmt, 8, avatar,-1,nil);
            sqlite3_bind_text(sqlite3_stmt, 9, phone,-1,nil);
            sqlite3_bind_text(sqlite3_stmt, 10, email,-1,nil);

            
            
            if(sqlite3_step(sqlite3_stmt) == SQLITE_DONE){
                print("new row added succefully")
            }
        }
        sqlite3_finalize(sqlite3_stmt);
    }
    
    func getAllPostFromDb () ->[Post] //like getAllPosts
    {
        var sqlite3_stmt: OpaquePointer? = nil
        var data = [Post]()
        if (sqlite3_prepare_v2(database,"SELECT * from POST;",-1,&sqlite3_stmt,nil) == SQLITE_OK){
        while(sqlite3_step(sqlite3_stmt) == SQLITE_ROW){
           
           let postId = String(cString:sqlite3_column_text(sqlite3_stmt,0)!)
            let productName = String(cString:sqlite3_column_text(sqlite3_stmt,1)!)
            let catagory = String(cString:sqlite3_column_text(sqlite3_stmt,2)!)
           let city = String(cString:sqlite3_column_text(sqlite3_stmt,3)!)
           let price = String(cString:sqlite3_column_text(sqlite3_stmt,4)!)
           let rentDates = String(cString:sqlite3_column_text(sqlite3_stmt,5)!)
          let moreDetails = String(cString:sqlite3_column_text(sqlite3_stmt,6)!)
          let avatar = String(cString:sqlite3_column_text(sqlite3_stmt,7)!)
          let phone = String(cString:sqlite3_column_text(sqlite3_stmt,8)!)
            let email = String(cString:sqlite3_column_text(sqlite3_stmt,9)!)

            Post.postID = postId
            data.append(Post(productName: productName, catagory: catagory, city: city, price: price, rentDates: rentDates, moreDetails: moreDetails, avatar: avatar, phone: phone, email: email))
           }
            
        }
        sqlite3_finalize(sqlite3_stmt)
        return data
    }
    
    func setLastUpdateDate(name:String,lud:Int64){
        var sqlite3_stmt: OpaquePointer? = nil
        if (sqlite3_prepare_v2(database,"INSERT OR REPLACE INTO LAST_UPDATE_DATE(NAME, LUD) VALUES (?,?);",-1,&sqlite3_stmt,nil) == SQLITE_OK){
            
            sqlite3_bind_text(sqlite3_stmt, 1, name,-1,nil);
            sqlite3_bind_int64(sqlite3_stmt, 2,lud);
            
            if(sqlite3_step(sqlite3_stmt) == SQLITE_DONE){
                print("new row added succefully")
            }
        }
        sqlite3_finalize(sqlite3_stmt);
    }
    
    func getLastUpdateDate(name:String)->Int64
    {
        var sqlite3_stmt: OpaquePointer? = nil
        var lud :Int64 = 0;
        if (sqlite3_prepare_v2(database,"SELECT * from LAST_UPDATE_DATE where NAME like ?;",-1,&sqlite3_stmt,nil) == SQLITE_OK){
            sqlite3_bind_text(sqlite3_stmt, 1, name,-1,nil);
            if(sqlite3_step(sqlite3_stmt) == SQLITE_ROW){
                lud = Int64(sqlite3_column_int64(sqlite3_stmt,1))
            }
        }
        sqlite3_finalize(sqlite3_stmt)
        return lud
    }
    
    func setNumOfPosts(num:Int,name:String){
            
            var sqlite3_stmt: OpaquePointer? = nil
            if (sqlite3_prepare_v2(database,"INSERT OR REPLACE INTO NUM_OF_POSTS(NAME, NUMBER) VALUES (?,?);",-1, &sqlite3_stmt,nil) == SQLITE_OK){
                
                sqlite3_bind_text(sqlite3_stmt, 1, name,-1,nil);
                sqlite3_bind_int(sqlite3_stmt, 2, Int32(num));
                if(sqlite3_step(sqlite3_stmt) == SQLITE_DONE){
                    print("new row added succefully")
                }
            }
            sqlite3_finalize(sqlite3_stmt)
        }
        
        func getNumOfPosts(name:String)->Int{
            
           var num:Int = 0;
            var sqlite3_stmt: OpaquePointer? = nil
            if (sqlite3_prepare_v2(database,"SELECT * from NUM_OF_POSTS where NAME like?;",-1,&sqlite3_stmt,nil) == SQLITE_OK){
                sqlite3_bind_text(sqlite3_stmt, 1, name,-1,nil);
                
                if(sqlite3_step(sqlite3_stmt) == SQLITE_ROW){
                    num = Int(sqlite3_column_int(sqlite3_stmt,1))
                }
            }
            sqlite3_finalize(sqlite3_stmt)
            return num
        }
        
        func delete(postId:String){
            //let val:Int = 12345
            
            let deleteStatementString = "DELETE FROM POST where POSTKEY = ?;"
            print(deleteStatementString)
            //        print("DELETE FROM POSTS where POSTID = " + postId + ";")
            var sqlite3_stmt: OpaquePointer? = nil
            
            if (sqlite3_prepare_v2(database,deleteStatementString,-1,&sqlite3_stmt,nil) == SQLITE_OK) {
                sqlite3_bind_text(sqlite3_stmt, 1, postId,-1,nil);

                if sqlite3_step(sqlite3_stmt) == SQLITE_DONE {
                    print("\nSuccessfully deleted row.")
                } else {
                    print("\nCould not delete row.")
                }
            } else {
                print("\nDELETE statement could not be prepared")
            }
            
            sqlite3_finalize(sqlite3_stmt)
        }
    }




