//
//  NewPostViewController.swift
//  FinalProject
//
//  Created by admin on 09/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
//protocol NewPostViewControllerDelegate {
//    func onPost();
//}

class NewPostViewController: UIViewController {
    //var delegate: NewPostViewControllerDelegate?;
    @IBOutlet weak var NewPostTitle: UILabel!
    @IBOutlet weak var CategoryPLabel: UILabel!
    @IBOutlet weak var CategoryPText: UITextField!
    @IBOutlet weak var NamePLabel: UILabel!
    @IBOutlet weak var NamePText: UITextField!
    @IBOutlet weak var ImagePLabel: UILabel!
    @IBOutlet weak var CityLabel: UILabel!
    @IBOutlet weak var CityText: UITextField!
    @IBOutlet weak var DatesLabel: UILabel!
    @IBOutlet weak var PriceText: UITextField!
    @IBOutlet weak var PriceLabel: UILabel!
    @IBOutlet weak var DetailsLabel: UILabel!
    @IBOutlet weak var DetailsText: UITextField!
    
    @IBAction func post(_ sender: UIButton) {
        self.tabBarController?.selectedIndex = 0		
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
     if(segue.identifier=="finishSegue")
     {
        let vcDest:PostsTableViewController = segue.destination as! PostsTableViewController;
        }
        
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView=false;
        view.addGestureRecognizer(tap);
    }

}
