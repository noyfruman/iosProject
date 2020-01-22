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

    func connect() {
         let dbFileName = "database2.db"
         if let dir = FileManager.default.urls(for: .documentDirectory, in:
        .userDomainMask).first{
         let path = dir.appendingPathComponent(dbFileName)
         if sqlite3_open(path.absoluteString, &database) != SQLITE_OK {
         print("Failed to open db file: \(path.absoluteString)")
         return
            }
        }
        create();
        
    }
    
    func create(){
    var errormsg: UnsafeMutablePointer<Int8>? = nil

    let res = sqlite3_exec(database, "CREATE TABLE IF NOT EXISTS POST(PS_ID TEXT PRIMARY KEY, PRODUCTNAME TEXT, CATAGORY TEXT, CITY TEXT, PRICE TEXT ,RENTDATES TEXT,MOREDETAILS TEXT, AVATAR TEXT, PHONE TEXT)", nil, nil, &errormsg);
        if(res != 0){
            print("error creating table");
            return
            }
    
    }
    
    
    func add(post:Post){
        //data.append(post)
        
        var sqlite3_stmt: OpaquePointer? = nil
        if (sqlite3_prepare_v2(database,"INSERT OR REPLACE INTO POST(PS_ID, PRODUCTNAME,CATAGORY, CITY,PRICE,RENTDATES,MOREDETAILS,AVATAR, PHONE) VALUES (?,?,?,?,?,?,?,?,?);" ,-1,&sqlite3_stmt,nil) == SQLITE_OK){
            let id = post.id.cString(using: .utf8)
            let productName = post.productName.cString(using: .utf8)
            let catagory = post.catagory.cString(using: .utf8)
            let city = post.city.cString(using: .utf8)
            let price = post.price.cString(using: .utf8)
            let rentDates = post.rentDates.cString(using: .utf8)
            let moreDetails = post.moreDetails.cString(using: .utf8)
            let avatar = post.avatar.cString(using: .utf8)
            let phone = post.phone.cString(using: .utf8)

            sqlite3_bind_text(sqlite3_stmt, 1, id,-1,nil);
            sqlite3_bind_text(sqlite3_stmt, 2, productName,-1,nil);
            sqlite3_bind_text(sqlite3_stmt, 3, catagory,-1,nil);
            sqlite3_bind_text(sqlite3_stmt, 4, city,-1,nil);
            sqlite3_bind_text(sqlite3_stmt, 5, price,-1,nil);
            sqlite3_bind_text(sqlite3_stmt, 6, rentDates,-1,nil);
            sqlite3_bind_text(sqlite3_stmt, 7, moreDetails,-1,nil);
            sqlite3_bind_text(sqlite3_stmt, 8, avatar,-1,nil);
            sqlite3_bind_text(sqlite3_stmt, 9, phone,-1,nil);


        if(sqlite3_step(sqlite3_stmt) == SQLITE_DONE){
            print("new row added succefully")
            }
        }
    }
    
    func getAllPosts()->[Post]
    {
        var sqlite3_stmt: OpaquePointer? = nil
         var data = [Post]()
         if (sqlite3_prepare_v2(database,"SELECT * from POST;",-1,&sqlite3_stmt,nil) == SQLITE_OK){
         while(sqlite3_step(sqlite3_stmt) == SQLITE_ROW){
            let psId = String(cString:sqlite3_column_text(sqlite3_stmt,0)!)
            let productName = String(cString:sqlite3_column_text(sqlite3_stmt,1)!)
            let catagory = String(cString:sqlite3_column_text(sqlite3_stmt,2)!)
            let city = String(cString:sqlite3_column_text(sqlite3_stmt,3)!)
            let price = String(cString:sqlite3_column_text(sqlite3_stmt,4)!)
            let rentDates = String(cString:sqlite3_column_text(sqlite3_stmt,5)!)
            let moreDetails = String(cString:sqlite3_column_text(sqlite3_stmt,6)!)
            let avatar = String(cString:sqlite3_column_text(sqlite3_stmt,7)!)
            let phone = String(cString:sqlite3_column_text(sqlite3_stmt,8)!)

            data.append(Post(id:psId,productName:productName,catagory: catagory,city: city,price: price,rentDates: rentDates,moreDetails: moreDetails,avatar: avatar, phone: phone))
            }
         }
         sqlite3_finalize(sqlite3_stmt)
         return data
    }
	
}


