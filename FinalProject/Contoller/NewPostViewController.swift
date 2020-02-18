//
//  NewPostViewController.swift
//  FinalProject
//
//  Created by admin on 09/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
class NewPostViewController: UIViewController,UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate { //we dont need all the labels. can delete it.
    //var delegate: NewPostViewControllerDelegate?;
    @IBOutlet weak var NewPostTitle: UILabel!
    @IBOutlet weak var CategoryPLabel: UILabel!
    @IBOutlet weak var CategoryPText: UITextField!
    @IBOutlet weak var NamePLabel: UILabel!
    @IBOutlet weak var NamePText: UITextField!
    @IBOutlet weak var ImagePLabel: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var Activities: UIActivityIndicatorView!
    @IBOutlet weak var Dates: UITextField!
    @IBOutlet weak var CityLabel: UILabel!
    @IBOutlet weak var CityText: UITextField!
    @IBOutlet weak var DatesLabel: UILabel!
    @IBOutlet weak var PriceText: UITextField!
    @IBOutlet weak var PriceLabel: UILabel!
    @IBOutlet weak var DetailsLabel: UILabel!
    @IBOutlet weak var DetailsText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    
    @IBOutlet weak var finishPicButton: UIButton!
    @IBOutlet weak var finishPostButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NamePText.delegate = self
        CategoryPText.delegate = self
        CityText.delegate = self
        Dates.delegate = self
        PriceText.delegate = self
        DetailsText.delegate = self
        phoneText.delegate = self
        Activities.isHidden = true;
        

    }
    
    @IBAction func Pic(_ sender: UIButton) { //to take photos from gallery/camera.
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerController.SourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self ;
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
        
    }
    var selectedImage:UIImage?
    
    @IBAction func postButton(_ sender:  UIButton) { //in eliav- save
        self.tabBarController?.selectedIndex = 0
        var post = Post(productName: self.NamePText.text!, catagory: self.CategoryPText.text!, city: self.CityText.text!, price: self.PriceText.text!, rentDates: self.Dates.text!, moreDetails: self.DetailsText.text!, avatar: "", phone: self.phoneText.text!, email: Post.userEmail)
        Activities.isHidden = false;
        finishPostButton.isEnabled = false;
        finishPicButton.isEnabled = false;
        
        
        if let selectedImage = selectedImage {
            Model.instance.saveImage(image: selectedImage){ (url) in
                post.avatar = url
                Model.instance.add(post: post)
                self.navigationController?.popViewController(animated: true)
                
            }
        }
        else {
            Model.instance.add(post: post)
            self.navigationController?.popViewController(animated: true)
            return
            
        }
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        selectedImage = info [UIImagePickerController.InfoKey.originalImage] as? UIImage;
        self.ImageView.image = selectedImage
        dismiss(animated: true, completion: nil)//to close the window of the photo.
    }
    
    
    func configureTextView(){
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         self.view.endEditing(true)
         
     }
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         textField.resignFirstResponder()
         return true;
     }
    
}
