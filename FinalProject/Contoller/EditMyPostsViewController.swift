//
//  EditMyPostsViewController.swift
//  FinalProject
//
//  Created by admin on 16/02/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class EditMyPostsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITextFieldDelegate{
    
    @IBOutlet weak var productNameText: UITextField!
    @IBOutlet weak var choosePicB: UIButton!
    @IBOutlet weak var catagoryText: UITextField!
    @IBOutlet weak var avatarImg: UIImageView!
    @IBOutlet weak var cityText: UITextField!
    @IBOutlet weak var datesText: UITextField!
    @IBOutlet weak var priceText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var moreDetailsText: UITextField!
    @IBOutlet weak var saveChangesB: UIButton!
    @IBOutlet weak var activities: UIActivityIndicatorView!
    
    
    
    
    var post: Post?
    var postId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productNameText.text=post?.productName
        catagoryText.text=post?.catagory
        cityText.text=post?.city
        priceText.text=post?.price
        datesText.text=post?.rentDates
        moreDetailsText.text=post?.moreDetails
        phoneText.text = post?.phone
        avatarImg.image = UIImage(named:"avatar")
        
        if(post?.avatar != "")
        {
            avatarImg.kf.setImage(with: URL(string:post!.avatar))
        }
        postId = post!.postId!
        activities.isHidden = true
        productNameText.delegate = self
        catagoryText.delegate = self
        cityText.delegate = self
        datesText.delegate = self
        priceText.delegate = self
        moreDetailsText.delegate = self
        phoneText.delegate = self
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    var selectedImg :UIImage?
    @IBAction func choosePicBtn(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerController.SourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self ;
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        selectedImg = info [UIImagePickerController.InfoKey.originalImage] as? UIImage;
        self.avatarImg.image = selectedImg
        dismiss(animated: true, completion: nil)//to close the window of the photo.
    }
    @IBAction func saveChangesBtn(_ sender: UIButton) {
        self.tabBarController?.selectedIndex = 0
        var post = Post(productName: self.productNameText.text!, catagory: self.catagoryText.text!, city: self.cityText.text!, price: self.priceText.text!, rentDates: self.datesText.text!, moreDetails: self.moreDetailsText.text!, avatar: "", phone: self.phoneText.text!, email: Post.userEmail)
        activities.isHidden = false;
        saveChangesB.isEnabled = false;
        choosePicB.isEnabled = false;
        
        
        if let selectedImage = selectedImg {
            Model.instance.saveImage(image: selectedImage){ (url) in
                post.avatar = url
                Model.instance.updateMyPost(postId: self.postId, post: post)
                self.navigationController?.popViewController(animated: true)
                
            }
        }
        else {
            Model.instance.updateMyPost(postId: postId, post: post)
            self.navigationController?.popViewController(animated: true)
            return
            
        }
    }
    
}



