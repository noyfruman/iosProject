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
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
//    {
//     if(segue.identifier=="registerSegue") //if-1 it is from sign-in button, we will need more 2 if's
//     {
//         let vcDest:SecondViewController = segue.destination as! SecondViewController;
//     }
//     
//    }
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
               tap.cancelsTouchesInView=false;
               view.addGestureRecognizer(tap);
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
