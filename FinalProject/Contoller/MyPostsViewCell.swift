//
//  MyPostsViewCell.swift
//  FinalProject
//
//  Created by admin on 16/02/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import SwipeCellKit

protocol MyPostsCellDelegate {
    func editPost(index:Int)
    func deletePost(index:Int)
}

class MyPostsViewCell: SwipeTableViewCell {

    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var avatarImg: UIImageView!
    @IBOutlet weak var catagoryLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var datesLabel: UILabel!
    @IBOutlet weak var moreDetailsLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
                                    /////finish////
