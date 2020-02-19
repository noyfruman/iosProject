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
        self.emailText.delegate = self
        self.PasswordText.delegate = self
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    @IBAction func signIn(_ sender: UIButton) {
        let user = User(email: emailText.text!, pass: PasswordText.text!)
        Model.instance.loginUser(user: user){ (email) in
            
            
            
            // check for empty fields:
            if (user.email.isEmpty || user.password.isEmpty)
            {
                self.displayMyAlertMessage(userMessage: "All fields are required")
                return
            }
             if (email == "wrong")
             {
                self.displayMyAlertMessage(userMessage: "Email or Password are inccorect.\n if you are not register please click on Sign-Up button")
                return
                }
            
            else{
                Post.userEmail = email
                self.performSegue(withIdentifier: "homeSegue", sender: self)
            }
        }
        
    }
    
    //
    //    if (email == "wrong"){
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



