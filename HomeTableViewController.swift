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
    
    @IBOutlet weak var createPostButton: UIBarButtonItem!
    
    var selectedPost: Post? = nil
    
    var selectedClub: Club? = nil
    
    var displayAllClubs: Bool = false
    
    var relevantPosts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate  = self
        tableView.dataSource = self
        
        if userId == "studentRandomNumber10382" {
            createPostButton.isEnabled = false
            createPostButton.tintColor = .clear
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let today = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let result = formatter.string(from: today)
        
        relevantPosts = subscribedPosts.filter({$0.postDa >= result})
        
        tableView.reloadData()
    }

    @IBAction func indexChanged(_ sender: Any) {
        switch displayPost.selectedSegmentIndex
        {
        case 1: displayAllClubs = true
            
        case 0: displayAllClubs = false
            
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
        var numOfSections: Int = 0
        if displayAllClubs && Post.posts.count > 0 || !displayAllClubs && relevantPosts.count > 0 {
            tableView.separatorStyle = .singleLine
            numOfSections = 1
            tableView.backgroundView = nil
        } else {
            let noDataLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
            noDataLabel.text = "No posts to be shown"
            noDataLabel.textColor = UIColor.gray
            noDataLabel.textAlignment = .center
            tableView.backgroundView = noDataLabel
            tableView.separatorStyle = .none
        }
        return numOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if displayAllClubs {
            return Post.posts.count
        } else {
            return relevantPosts.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var post = Post.posts[indexPath.row]
        
        if !displayAllClubs {
            post = relevantPosts[indexPath.row]
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
            post = relevantPosts[indexPath.row]
        }

        selectedPost = post
        performSegue(withIdentifier: "showpost", sender: self)
    }
    
    func viewImage(tapGestureRecognizer: UITapGestureRecognizer) {
        //the following line indicates the actual label tapped:
        let clubidentifier = tapGestureRecognizer.view as! UILabel
        
        for club in clubs {
            if club.ClubNa == clubidentifier.text {
                selectedClub = club
            }
        }
        performSegue(withIdentifier: "showclubinformationthroughpost", sender: self)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var post = Post.posts[indexPath.row]
        
        if !displayAllClubs {
            post = relevantPosts[indexPath.row]
        }
        
        if post.postedImage.isEmpty && post.postDe == "" {
            
            if let cell: HomeTableViewCellWithoutBoth = tableView.dequeueReusableCell(withIdentifier: "cellWithoutBoth", for: indexPath) as? HomeTableViewCellWithoutBoth {
            
                // allowing action when label (over the cellImage) is tapped
                let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewImage(tapGestureRecognizer:)))
                cell.labelOverImage.isUserInteractionEnabled = true
                cell.labelOverImage.addGestureRecognizer(tapGestureRecognizer)
            
                // Configure the cell...
                cell.labelOverImage?.text = post.clubIdentifier
                cell.cellTitle?.text = post.postTi
                cell.cellImage.image = post.postImage
                cell.cellIdentifier?.text = post.clubIdentifier
                cell.cellDate.text = post.postDa
                if post.postDa == "" {
                    cell.cellDate.isHidden = true
                }
                return cell
                
            } else {
                assertionFailure("Unable to dequeue cell")
                return UITableViewCell()
            }
        }
        else if post.postDe == "" {

            if let cell: HomeTableViewCellWithoutDescription = tableView.dequeueReusableCell(withIdentifier: "cellWithoutDescription", for: indexPath) as? HomeTableViewCellWithoutDescription {
            
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
                cell.cellDate.text = post.postDa
                if post.postDa == "" {
                    cell.cellDate.isHidden = true
                }
                return cell
                
            } else {
                assertionFailure("Unable to dequeue cell")
                return UITableViewCell()
            }
        }
        else if post.postedImage.isEmpty {
            
            if let cell: HomeTableViewCellWithoutImage = tableView.dequeueReusableCell(withIdentifier: "cellWithoutImage", for: indexPath) as? HomeTableViewCellWithoutImage {
            
                // allowing action when label (over the cellImage) is tapped
                let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewImage(tapGestureRecognizer:)))
                cell.labelOverImage.isUserInteractionEnabled = true
                cell.labelOverImage.addGestureRecognizer(tapGestureRecognizer)
                
                // Configure the cell...
                cell.labelOverImage?.text = post.clubIdentifier
                cell.cellTitle?.text = post.postTi
                cell.cellDescription?.text = post.postDe
                cell.cellImage.image = post.postImage
                cell.cellDate.text = post.postDa
                if post.postDa == "" {
                    cell.cellDate.isHidden = true
                }

                return cell
                
            } else {
                assertionFailure("Unable to dequeue cell")
                return UITableViewCell()
            }
        }
        else {
            
            if let cell: HomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath) as? HomeTableViewCell {
                
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
                cell.cellDate.text = post.postDa
                if post.postDa == "" {
                    cell.cellDate.isHidden = true
                }

                /*
                 if let postDa = post.postDa {
                 cell.cellDate.text = postDa
                 } else {
                 cell.cellDate.isHidden = true
                 }
                 */
                
                return cell
                
            } else {
                assertionFailure("Unable to dequeue cell")
                return UITableViewCell()
            }
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
