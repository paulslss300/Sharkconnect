//
//  HomeTableViewController.swift
//  IDK
//
//  Created by Student on 2018-01-16.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class HomeTableViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var displayPost: UISegmentedControl!

    var selectedPost: Post? = nil
    
    var selectedClub: Club? = nil
    
    var displayAllClubs: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate  = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    @IBAction func indexChanged(_ sender: Any) {
        switch displayPost.selectedSegmentIndex
        {
        case 0: displayAllClubs = true
            
        case 1: displayAllClubs = false
            
        default:
            break
        }
        tableView.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if displayAllClubs {
            return Post.posts.count
        } else {
            return subscribedPosts.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var post = Post.posts[indexPath.row]
        
        if !displayAllClubs {
            post = subscribedPosts[indexPath.row]
        }
        
        if post.postedImage.isEmpty && post.postDe == "" {
            return 126
        } else if post.postedImage.isEmpty {
            return 182
        } else if post.postDe == "" {
            return 218
        } else {
            return 283
        }
    }
 
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var post = Post.posts[indexPath.row]
        
        if !displayAllClubs {
            post = subscribedPosts[indexPath.row]
        }

        selectedPost = post
        performSegue(withIdentifier: "showpost", sender: self)
    }
    
    func viewImage(tapGestureRecognizer: UITapGestureRecognizer) {
        //the following line indicates the actual label tapped:
        let clubidentifier = tapGestureRecognizer.view as! UILabel
        
        for club in Club.clubs {
            if club.ClubNa == clubidentifier.text {
                selectedClub = club
            }
        }
        performSegue(withIdentifier: "showclubinformationthroughpost", sender: self)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var post = Post.posts[indexPath.row]
        
        if !displayAllClubs {
            post = subscribedPosts[indexPath.row]
        }
        
        if post.postedImage.isEmpty && post.postDe == "" {
            
            let cell: HomeTableViewCellWithoutBoth = tableView.dequeueReusableCell(withIdentifier: "cellWithoutBoth", for: indexPath) as! HomeTableViewCellWithoutBoth
            
            // allowing action when label (over the cellImage) is tapped
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewImage(tapGestureRecognizer:)))
            cell.labelOverImage.isUserInteractionEnabled = true
            cell.labelOverImage.addGestureRecognizer(tapGestureRecognizer)
            
            // Configure the cell...
            cell.labelOverImage?.text = post.clubIdentifier
            cell.cellTitle?.text = post.postTi
            cell.cellImage.image = post.postImage
            cell.cellIdentifier?.text = post.clubIdentifier
            if post.postDa != nil {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                cell.cellDate.text = dateFormatter.string(from: post.postDa!)
            } else {
                cell.cellDate.isHidden = true
            }
            
            return cell
        }
        else if post.postDe == "" {

            let cell: HomeTableViewCellWithoutDescription = tableView.dequeueReusableCell(withIdentifier: "cellWithoutDescription", for: indexPath) as! HomeTableViewCellWithoutDescription
            
            // allowing action when label (over the cellImage) is tapped
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewImage(tapGestureRecognizer:)))
            cell.labelOverImage.isUserInteractionEnabled = true
            cell.labelOverImage.addGestureRecognizer(tapGestureRecognizer)
            
            // Configure the cell...
            cell.labelOverImage?.text = post.clubIdentifier
            cell.cellTitle?.text = post.postTi
            cell.cellImage.image = post.postImage
            cell.imageList = post.postedImage
            cell.cellPostedImage.reloadData()
            cell.cellIdentifier?.text = post.clubIdentifier
            if post.postDa != nil {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                cell.cellDate.text = dateFormatter.string(from: post.postDa!)
            } else {
                cell.cellDate.isHidden = true
            }
            
            return cell
        }
        else if post.postedImage.isEmpty {
            
            let cell: HomeTableViewCellWithoutImage = tableView.dequeueReusableCell(withIdentifier: "cellWithoutImage", for: indexPath) as! HomeTableViewCellWithoutImage
            
            // allowing action when label (over the cellImage) is tapped
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewImage(tapGestureRecognizer:)))
            cell.labelOverImage.isUserInteractionEnabled = true
            cell.labelOverImage.addGestureRecognizer(tapGestureRecognizer)
            
            // Configure the cell...
            cell.labelOverImage?.text = post.clubIdentifier
            cell.cellTitle?.text = post.postTi
            cell.cellDescription?.text = post.postDe
            cell.cellImage.image = post.postImage
            cell.cellIdentifier?.text = post.clubIdentifier
            if post.postDa != nil {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                cell.cellDate.text = dateFormatter.string(from: post.postDa!)
            } else {
                cell.cellDate.isHidden = true
            }
            
            return cell
        }
        else {
            
            let cell: HomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath) as! HomeTableViewCell
            
            // allowing action when label (over the cellImage) is tapped
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewImage(tapGestureRecognizer:)))
            cell.labelOverImage.isUserInteractionEnabled = true
            cell.labelOverImage.addGestureRecognizer(tapGestureRecognizer)
            
            // Configure the cell...
            cell.labelOverImage?.text = post.clubIdentifier
            cell.cellTitle?.text = post.postTi
            cell.cellDescription?.text = post.postDe
            cell.cellImage.image = post.postImage
            cell.imageList = post.postedImage
            cell.cellPostedImage.reloadData()
            cell.cellIdentifier?.text = post.clubIdentifier
            if post.postDa != nil {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                cell.cellDate.text = dateFormatter.string(from: post.postDa!)
            } else {
                cell.cellDate.isHidden = true
            }
            
            return cell
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let destinationViewController = segue.destination as? ViewPostViewCellViewController {
            destinationViewController.selectedPost = selectedPost
        }
        
        if let destinationViewController = segue.destination as? ClubInformationViewController {
            destinationViewController.selectedClub = selectedClub
        }
    }
    

}
