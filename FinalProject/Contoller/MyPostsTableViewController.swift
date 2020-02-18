//
//  MyPostsTableViewController.swift
//  FinalProject
//
//  Created by admin on 16/02/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import SwipeCellKit

class MyPostsTableViewController: UITableViewController {
    
    
    var data = [Post]()
    var postID:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.addTarget(self, action: #selector(reloadData), for: .valueChanged)
        ModelEvents.PostDataEvent.observe {
            self.reloadData();
        }
        self.refreshControl?.beginRefreshing()
        reloadData();
    }
    @objc func reloadData(){
        
        Model.instance.getMyPosts { (_data:[Post]?) in
            if(_data != nil){
                self.data = _data!;
                self.tableView.reloadData();
            }
            self.refreshControl?.endRefreshing();
        }
    }
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MyPostsViewCell = tableView.dequeueReusableCell(withIdentifier: "MyPostsCell", for: indexPath) as! MyPostsViewCell

        cell.delegate = self
        let post = data[indexPath.row]
        cell.productNameLabel.text = post.productName
        cell.catagoryLabel.text = post.catagory
        cell.cityLabel.text = post.city
        cell.priceLabel.text = post.price
        cell.datesLabel.text = post.rentDates
        cell.moreDetailsLabel.text = post.moreDetails
        cell.phoneLabel.text = post.phone
        
        cell.avatarImg.image = UIImage(named: "avatar")
        
        if (post.avatar != "")
        {
            cell.avatarImg.kf.setImage(with: URL(string: post.avatar)) //load the images.
        }
        
        
        return cell
        
    }
    
    var selectedPost: Post?
    func editPost(index:Int)
    {
        selectedPost = data[index]
        performSegue(withIdentifier: "postEditSegue", sender: self)
    }
    
    func deletePost(index:Int)
    {
        Model.instance.deleteMyPost(postID: data[index].postId!)
        reloadData()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?)
    {
        if segue.identifier == "postEditSegue"
        {
            let vc: EditMyPostsViewController = segue.destination as! EditMyPostsViewController
            vc.post = selectedPost
        }
    }
}

extension MyPostsTableViewController : SwipeTableViewCellDelegate
{
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else{ return nil}
        let delete = SwipeAction (style: .destructive, title: "Delete") { action, indexPath in
            self.deletePost(index: indexPath.row)
        }
        let edit = SwipeAction (style: .destructive, title: "Edit") { action, indexPath in
                   self.editPost(index: indexPath.row)
    }
        delete.image = UIImage(named: "deleteIcon")
        delete.backgroundColor = UIColor.blue;
        edit.image = UIImage(named: "editIcon")
        edit.backgroundColor = UIColor.red
        
        return [delete,edit]
}
    func updateAction(at indexPath: IndexPath) //maybe to delete this func !!
    {
        print("item deleted from superclass")
    }
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }
}
    

    

