//
//  PostsPageViewController.swift
//  FinalProject
//
//  Created by admin on 09/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class PostsPageViewController: UIViewController {
    @IBOutlet weak var TitlePLabel: UILabel!
    
    @IBAction func ContactButton(_ sender: UIButton) {
    }
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

