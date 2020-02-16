//
//  SecondViewController.swift
//  FinalProject
//
//  Created by admin on 09/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController { //Search Screen

 //   @IBOutlet weak var dropDownCat: UIPickerView!
    @IBOutlet weak var quesTitle: UILabel!
  //  @IBOutlet weak var textBox: UITextField!

    /*    var list = ["1", "2", "3"]

        public func numberOfComponents(in pickerView: UIPickerView) -> Int{
            return 1
        }

        public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{

            return list.count
        }

        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

            self.view.endEditing(true)
            return list[row]
        }

        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

            self.textBox.text = self.list[row]
            self.dropDownCat.isHidden = true
        }

        func textFieldDidBeginEditing(_ textField: UITextField) {

            if textField == self.textBox {
                self.dropDownCat.isHidden = false
                //if you don't want the users to se the keyboard type:

                textField.endEditing(true)
            }
        }
 */
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryText: UITextField!
    @IBOutlet weak var subcategoryText: UITextField!
    @IBOutlet weak var subcategoryLabel: UILabel!
    @IBOutlet weak var DateLabel: UILabel!
   
    
    @IBAction func SearchButton(_ sender: UIButton) {
        categoryText.resignFirstResponder();
        subcategoryText.resignFirstResponder();
        
    }
//    @IBAction func NewPostButton(_ sender: UIButton) {
//    }
//    @IBAction func MainpageButton(_ sender: UIButton) {
//    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
//    {
//     if(segue.identifier=="newPostSegue") //if-1 it is from new post button, we will need more 2 if's
//     {
//         let vcDest:NewPostViewController = segue.destination as! NewPostViewController;
//     }
//     if(segue.identifier=="postsPageSegue") //if-1 it is from new post button, we will need more 2 if's
//     {
//           let vcDest:PostsPageViewController = segue.destination as! PostsPageViewController;
//     }
//    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView=false;
        view.addGestureRecognizer(tap);
    }
//    @IBAction func backFromNewPost (segue: UIStoryboardSegue){
//
//         }
//    @IBAction func backFromPostsPage (segue: UIStoryboardSegue){
//
//         }

}
