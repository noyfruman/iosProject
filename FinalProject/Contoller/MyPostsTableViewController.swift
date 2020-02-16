//
//  MyPostsTableViewController.swift
//  FinalProject
//
//  Created by admin on 16/02/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
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
            let vc: EditMyPostViewController = segue.destination as! EditMyPostViewController
            vc.post = selectedPost
        }
    }
}

    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    

