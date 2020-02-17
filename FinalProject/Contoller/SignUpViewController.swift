//
//  SignUpViewController.swift
//  FinalProject
//
//  Created by admin on 09/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import FirebaseAuth
class SignUpViewController: UIViewController,UITextViewDelegate,UITextFieldDelegate {
    
    //    @IBAction func BackButton(_ sender: UIButton) {
    //    }
    @IBOutlet weak var SignupLabel: UILabel!
    @IBOutlet weak var PasswordLabel: UILabel!
    @IBOutlet weak var PasswordText: UITextField!
    @IBOutlet weak var EmailLabel: UILabel!
    @IBOutlet weak var EmailText: UITextField!
    
    @IBAction func RegisterButton(_ sender: Any) {
        let user = User(email: EmailText.text!, pass: PasswordText.text!)
        Model.instance.CreateUser(user: user){ (email) in
     
            // check for empty fields:
            if (user.email.isEmpty || user.password.isEmpty)
                    {
                       
                     self.displayMyAlertMessage(userMessage: "All fields are required")
                        return
                    }
           else{
                Post.userEmail = email
                self.performSegue(withIdentifier: "signUpToHomeSegue", sender: self)
            }
        }
       
    }
    
    ///////////////
//            if (email == "Wrong"){
//                Utilities().showAlert(title: "Error", message:"try Again", vc:self)
//            }
 
    func displayMyAlertMessage(userMessage :String)
    {
        var myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        myAlert.addAction(okAction)
        //self.presentingViewController(myAlert)
        self.present(myAlert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    
}
