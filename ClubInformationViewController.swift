//
//  ClubInformationViewController.swift
//  IDK
//
//  Created by Student on 2018-02-13.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class ClubInformationViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if selectedClub?.ClubNa == "School" {
            subscribeButton.isHidden = true
        }
        postTableView.delegate  = self
        postTableView.dataSource = self
        scrollView.delegate = self
        clubDe.text = selectedClub?.ClubDe
        clubCoverImage.image = selectedClub?.ClubCellCoverImage
        clubImage.image = selectedClub?.ClubCellImageName
        subscribeButton.layer.cornerRadius = 6.0
    
        self.title = selectedClub?.ClubNa
    }
    
    override func viewWillAppear(_ animated: Bool) {
        recentPosts.removeAll()
        for post in Post.posts {
            if post.clubIdentifier == (selectedClub?.ClubNa)! {
                recentPosts += [post]
                print(post.postTi)
                print(post.postDe)
            }
        }
        postTableView.reloadData()
        
        for club in subscribedClubs {
            if club.ClubNa == (selectedClub?.ClubNa)! {
                subscribeButton.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var postTableView: UITableView!

    var selectedClub: Club? = nil
    
    var selectedPost: Post? = nil
    
    var recentPosts = [Post]()
    
    @IBOutlet weak var subscribeButton: UIButton!
    
    @IBOutlet weak var clubName: UILabel!
    
    @IBOutlet weak var clubDe: UITextView!
    //clubDe.delegate = self
    
    @IBOutlet weak var clubCoverImage: UIImageView!
    
    @IBOutlet weak var clubImage: UIImageView!
    
    @IBAction func suscribeButton(_ sender: Any) {
        
        var noDuplicate: Bool = true
        
        for club in subscribedClubs {
            if (selectedClub?.ClubNa)! == club.ClubNa {
                noDuplicate = false
                subscribedClubs = subscribedClubs.filter({ (club) -> Bool in
                    return !(club.ClubNa == selectedClub?.ClubNa)
                })
                subscribedPosts = subscribedPosts.filter({$0.clubIdentifier != selectedClub?.ClubNa})
                subscribeButton.backgroundColor = UIColor(red: 159/225.0, green: 168/225.0, blue: 183/225.0, alpha: 1)
                break
            }
        }
        
        if noDuplicate {
            subscribedClubs += [selectedClub!]
            for post in Post.posts{
                if post.clubIdentifier == selectedClub?.ClubNa {
                    subscribedPosts += [post]
                }
            }
            subscribeButton.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return recentPosts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let post = recentPosts[indexPath.row]
        
        if post.postedImage.isEmpty && post.postDe == "" {
            return 80
        } else if post.postedImage.isEmpty {
            return 160
        } else if post.postDe == "" {
            return 218
        } else {
            return 283
        }
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = recentPosts[indexPath.row]
        selectedPost = post
        performSegue(withIdentifier: "showpost", sender: self)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let post = recentPosts[indexPath.row]
        
        if post.postedImage.isEmpty && post.postDe == "" {
            let cell: ClubInfoVCTableViewCellWithoutBoth = tableView.dequeueReusableCell(withIdentifier: "CellWithoutBoth2", for: indexPath) as! ClubInfoVCTableViewCellWithoutBoth
            
            cell.cellTitle?.text = post.postTi
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
            let cell: ClubInfoVCTableViewCellWithoutDescription = tableView.dequeueReusableCell(withIdentifier: "CellWithoutDescription2", for: indexPath) as! ClubInfoVCTableViewCellWithoutDescription
            
            cell.cellTitle?.text = post.postTi
            cell.imageList = post.postedImage
            cell.cellPostedImage.reloadData()

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
            let cell: ClubInfoVCTableViewCellWithoutImage = tableView.dequeueReusableCell(withIdentifier: "CellWithoutImage2", for: indexPath) as! ClubInfoVCTableViewCellWithoutImage
            
            cell.cellTitle?.text = post.postTi
            cell.cellDescription?.text = post.postDe
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
            let cell: ClubIInformationTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ClubInfoPostCells2", for: indexPath) as! ClubIInformationTableViewCell
            
            
            cell.postTitle?.text = post.postTi
            cell.postDescription?.text = post.postDe
            cell.imageList = post.postedImage
            cell.postImage.reloadData()
            
            if post.postDa != nil {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                cell.postDate.text = dateFormatter.string(from: post.postDa!)
            } else {
                cell.postDate.isHidden = true
            }
            return cell
            
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? ViewPostViewCellViewController {
            destinationViewController.selectedPost = selectedPost
        }
    }
 

}
