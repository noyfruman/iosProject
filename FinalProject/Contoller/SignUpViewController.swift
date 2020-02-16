//
//  SignUpViewController.swift
//  FinalProject
//
//  Created by admin on 09/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

//    @IBAction func BackButton(_ sender: UIButton) {
//    }
    @IBOutlet weak var SignupLabel: UILabel!
    @IBOutlet weak var FullNameLabel: UILabel!
    @IBOutlet weak var FullNameText: UITextField!
    @IBOutlet weak var PasswordLabel: UILabel!
    @IBOutlet weak var PasswordText: UITextField!
    @IBOutlet weak var VerPassword: UITextField!
    @IBOutlet weak var VerPasswordLabel: UILabel!
    @IBOutlet weak var EmailLabel: UILabel!
    @IBOutlet weak var EmailText: UITextField!
    
    @IBAction func RegisterButton(_ sender: UIButton) {
        let user = User(email: EmailText.text!, pass: PasswordText.text!)
        Model.instance.CreateUser(user: user){ (email) in
                    if (email == "Wrong"){
                        //Utilities().showAlert(title: "Error", message:"try Again", vc:self)
                        let alert = UIAlertController (title: "Error", message: "try again", preferredStyle: .alert)
                        self.present(alert, animated: true)
                    }
                    else{
                        Post.userEmail = email
                        self.performSegue(withIdentifier: "signUpToHomeSegue", sender: self)
                    }
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
            view.addGestureRecognizer(tap)
        }
        
        @objc func dismissKeyboard(){
            view.endEditing(true)
        }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
