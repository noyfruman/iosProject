//
//  ViewController.swift
//  FinalProject
//
//  Created by admin on 09/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController { //sign in

    @IBOutlet weak var myTitle: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var PasswordText: UITextField!
    /*@IBAction func signIn(_ sender: UIButton) {
        userNameText.resignFirstResponder();
        PasswordText.resignFirstResponder();
        
//        let storyboard=UIStoryboard(name: "Main", bundle: nil);
//
//        let myNewVC = storyboard.instantiateViewController(withIdentifier: "SecondViewID") as! SecondViewController;
//        present(myNewVC, animated: true, completion: nil)
//
    }
 */
   override func prepare(for segue: UIStoryboardSegue, sender: Any?)
   {

    if(segue.identifier=="signupSegue") //if-2 it is from sign-up button, we will need more 1 if's
       {
           let vcDest:SignUpViewController = segue.destination as! SignUpViewController;
       }
    }
    
    
    @IBOutlet weak var signInButton: UIButton!
    @IBAction func signUp(_ sender: UIButton) {
    }
    @IBOutlet weak var SignUpButton: UIButton!
    @IBOutlet weak var LoginFacebook: UIButton!
    @IBAction func LoginFacebook(_ sender: UIButton) {
    }
   /* @objc func dismissKeyboard(){
        view.endEditing(true);
    }*/
    override func viewDidLoad() {
        super.viewDidLoad()
       // myTitle.text = "This is my new title";
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView=false;
        view.addGestureRecognizer(tap);
        
        
        
        
    }
  
//    @IBAction func backFromSignUp (segue: UIStoryboardSegue){
//        
//    }
    

}

