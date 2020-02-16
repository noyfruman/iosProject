//
//  PostInfoViewController.swift
//  FinalProject
//
//  Created by admin on 16/02/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class PostInfoViewController: UIViewController {

    @IBOutlet weak var avateImage: UIImageView!

    
    @IBOutlet weak var productNameLabel: UILabel!
    
    @IBOutlet weak var catagoryLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!

    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var moreDetailsLabel: UILabel!
    
    @IBOutlet weak var datesLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var post: Post?
    override func viewDidLoad() {
        super.viewDidLoad()
        productNameLabel.text=post?.productName
        catagoryLabel.text=post?.catagory
        cityLabel.text=post?.city
        priceLabel.text=post?.price
        datesLabel.text=post?.rentDates
        moreDetailsLabel.text=post?.moreDetails
        phoneLabel.text = post?.phone
        avateImage.image = UIImage(named:"avatar")
        
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
