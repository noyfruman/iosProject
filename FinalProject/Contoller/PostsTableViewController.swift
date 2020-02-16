






//
//  PostsTableViewController.swift
//  FinalProject
//
//  Created by admin on 14/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import Kingfisher

class PostsTableViewController: UITableViewController {
    
    var data = [Post]()
  //  var observer: Any?
    override func viewDidLoad() {
        
        super.viewDidLoad()
        Post.numberOfPosts = Model.instance.modelSql.getNumOfPosts(name: "POST")
        self.refreshControl = UIRefreshControl();
        self.refreshControl?.addTarget(self, action: #selector(reloadData), for: .valueChanged)
        ModelEvents.PostDataEvent.observe {
            self.refreshControl?.beginRefreshing()
            self.reloadData();

        }
        self.refreshControl?.beginRefreshing()
        reloadData();
    }
    
    @objc func reloadData(){
        
        Model.instance.getAllPosts { (_data:[Post]?) in
            if(_data != nil){
                self.data = _data!;
                self.tableView.reloadData();
            }
            self.refreshControl?.endRefreshing();
        }
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:PostsViewCell = tableView.dequeueReusableCell(withIdentifier: "PostCell",for: indexPath) as! PostsViewCell
        
        let ps = data[indexPath.row]
        
        cell.productNameLabel.text = ps.productName
        cell.catagoryLabel.text = ps.catagory
        cell.cityLabel.text = ps.city
        cell.priceLabel.text = ps.price
        cell.dateLabel.text = ps.rentDates
        cell.moreDetailsLabel.text = ps.moreDetails
        cell.phoneLabel.text = ps.phone
        cell.avatarImg.image = UIImage(named: "avatar")

        if (ps.avatar != "")
        {
            cell.avatarImg.kf.setImage(with: URL(string: ps.avatar)) //load the images.
        }
        
        return cell
    }
    var selectedPost: Post?
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
              selectedPost = data[indexPath.row]
                  performSegue(withIdentifier: "postInfoSegue", sender: self)
          }
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if( segue.identifier == "postInfoSegue")
            {
                let vc:PostInfoViewController = segue.destination as! PostInfoViewController
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
    
      

