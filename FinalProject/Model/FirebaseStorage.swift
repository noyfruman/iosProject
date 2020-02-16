//
//  FirebaseStorage.swift
//  FinalProject
//
//  Created by admin on 23/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import  UIKit
import Firebase

class FirebaseStorage{

    static func saveImage(image:UIImage, callback:@escaping (String)->Void) {
        let storageRef = Storage.storage().reference(forURL: "gs://ios-2019-final-project.appspot.com")
        let data = image.jpegData(compressionQuality: 0.8)
        let imageName: String = "image" + self.getCurrentTimeStampWOMiliseconds(dateToConvert: NSDate())+String(Int.random(in: 1..<99999999999));
        let imageRef = storageRef.child(imageName)
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        imageRef.putData(data!, metadata: metadata) { (metadata, error) in
            imageRef.downloadURL { (url, error) in
                guard let downloadURL = url else {
                    // Uh-oh, an error occurred!
                    return
                }
                print("url: \(downloadURL)")
                callback(downloadURL.absoluteString)
            }
        }
    }
    func getImage(url:String, callback:@escaping (UIImage?)->Void){
        let ref = Storage.storage().reference(forURL: url)
        ref.getData(maxSize: 10 * 1024 * 1024) { data, error in
            if error != nil {
                callback(nil)
            } else {
                let image = UIImage(data: data!)
                callback(image)
            }
        }
    }
    
    static func getCurrentTimeStampWOMiliseconds(dateToConvert: NSDate) ->String{
        let objDateFormat: DateFormatter = DateFormatter();
        objDateFormat.dateFormat = "yyyy-MM-dd"
        let strTime:String = objDateFormat.string(from: dateToConvert as Date);
        let objUTCDate: NSDate=objDateFormat.date(from: strTime)! as NSDate;
        let miliseconds: Int64 = Int64(objUTCDate.timeIntervalSince1970);
        let strTimeStamp: String = "\(miliseconds)"
        return strTimeStamp;
    }
    
}
