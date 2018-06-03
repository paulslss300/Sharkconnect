//
//  ClubInformationViewController.swift
//  IDK
//
//  Created by Student on 2018-02-13.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class ClubInformationViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    //subscribeButton.backgroundColor = UIColor(red: 102, green: 153, blue: 153, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postTableView.delegate  = self
        postTableView.dataSource = self
        scrollView.delegate = self
        postTableView.isScrollEnabled = false
        clubDe.text = selectedClub?.ClubDe
        clubCoverImage.image = selectedClub?.ClubCellCoverImage
        clubImage.image = selectedClub?.ClubCellImageName
        subscribeButton.layer.cornerRadius = 6.0
    
        self.title = selectedClub?.ClubNa

        clubDe.textColor = UIColor.lightGray
        postTableView.isScrollEnabled = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        for post in Post.posts {
            if post.clubIdentifier == (selectedClub?.ClubNa)! {
                recentPosts += [post]
            }
        }
        
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
        
        //sender.isSelected = !sender.isSelected
        
        var noDuplicate: Bool = true
        
        for club in subscribedClubs {
            if (selectedClub?.ClubNa)! == club.ClubNa {
                noDuplicate = false
                subscribedClubs = subscribedClubs.filter({ (club) -> Bool in
                    return !(club.ClubNa == selectedClub?.ClubNa)
                })
                subscribeButton.backgroundColor = UIColor(red: 159/225.0, green: 168/225.0, blue: 183/225.0, alpha: 1)
                break
            }
        }
        
        if noDuplicate {
            subscribedClubs += [selectedClub!]
            subscribeButton.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return recentPosts.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = recentPosts[indexPath.row]
        selectedPost = post
        performSegue(withIdentifier: "showpost", sender: self)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ClubIInformationTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ClubInfoPostCells", for: indexPath) as! ClubIInformationTableViewCell
        
        let post = recentPosts[indexPath.row]
        cell.postTitle?.text = post.postTi
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        cell.postDate?.text = dateFormatter.string(from: post.postDa)
        cell.postDescription?.text = post.postDe
        
        return cell
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
