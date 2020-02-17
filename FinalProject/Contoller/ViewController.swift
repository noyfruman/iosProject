//
//  ViewController.swift
//  FinalProject
//
//  Created by admin on 09/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UITextViewDelegate,UITextFieldDelegate{ //sign in
    
    @IBOutlet weak var myTitle: UILabel!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var PasswordText: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //        navigationController?.hidesBarsWhenKeyboardAppears = true
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    @IBAction func signIn(_ sender: UIButton) {
        //        PasswordText.resignFirstResponder();
        //        emailText.resignFirstResponder();
        let user = User(email: emailText.text!, pass: PasswordText.text!)
        Model.instance.loginUser(user: user){ (email) in
            
            
            
            // check for empty fields:
            if (user.email.isEmpty || user.password.isEmpty) || (email == "wrong")
            {
                self.displayMyAlertMessage(userMessage: "All fields are required")
                return
            }
            else{
                Post.userEmail = email
                self.performSegue(withIdentifier: "homeSegue", sender: self)
            }
        }
        
    }
    
    //
    //    if (email == "Wrong"){
    //    Utilities().showAlert(title:"Error", message:"Try Again", vc:self)
    //    }
    
    
    
    func displayMyAlertMessage(userMessage :String)
    {
        var myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        myAlert.addAction(okAction)
        //self.presentingViewController(myAlert)
        self.present(myAlert, animated: true, completion: nil)
    }
    //@IBOutlet weak var signInButton: UIButton!
    @IBAction func signUp(_ sender: UIButton) {
    }
    @IBOutlet weak var SignUpButton: UIButton!
    @IBOutlet weak var LoginFacebook: UIButton!
    @IBAction func LoginFacebook(_ sender: UIButton) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "homeSegue"){
            
        }
    }
}



