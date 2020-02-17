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
   
    
      

