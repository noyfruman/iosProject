//
//  ModelFirebase.swift
//  FinalProject
//
//  Created by Studio on 22/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import Firebase
class ModelFirebase{
    
    func add(post:Post){
        let db = Firestore.firestore()
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = db.collection("posts").addDocument(data: post.toJson(), completion: { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        })
        
    }
    
    func getAllPosts (callback: @escaping ([Post]?)-> Void)
    {
        let db = Firestore.firestore()
        
        db.collection("posts").getDocuments { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                callback(nil);
            } else {
                var data = [Post]();
                for document in querySnapshot!.documents {
                    data.append(Post(json: document.data()))
                }
                callback(data);
            }
        };
    }
    
}
