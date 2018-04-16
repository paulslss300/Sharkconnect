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
    
    var selectedClub: Club? = nil
    
    var displayAllClubs: Bool = true
    //var createPost = CreatePostViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate  = self
        tableView.dataSource = self

        //let post1 = Post()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        subscribedPosts = []
        
        for post in Post.posts{
            for club in subscribedClubs {
                if post.clubIdentifier == club.ClubNa {
                    subscribedPosts += [post]
                }
            }
        }

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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if displayAllClubs {
            let post = Post.posts[indexPath.row]
            for club in Club.clubs {
                if club.ClubNa == post.clubIdentifier {
                    selectedClub = club
                    performSegue(withIdentifier: "showclubinformationthroughpost", sender: self)
                }
            }
        } else {
            let post = subscribedPosts[indexPath.row]
            for club in Club.clubs {
                if club.ClubNa == post.clubIdentifier {
                    selectedClub = club
                    performSegue(withIdentifier: "showclubinformationthroughpost", sender: self)
                }
            }
        }

    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! HomeTableViewCell
        
        if displayAllClubs {
            let post = Post.posts[indexPath.row]
            // Configure the cell...
            cell.cellTitle?.text = post.postTi
            cell.cellDescription?.text = post.postDe
            cell.cellImage.image = post.postImage
            cell.cellIdentifier?.text = post.clubIdentifier
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            cell.cellDate?.text = dateFormatter.string(from: post.postDa)
        } else {
            let post = subscribedPosts[indexPath.row]
            // Configure the cell...
            cell.cellTitle?.text = post.postTi
            cell.cellDescription?.text = post.postDe
            cell.cellImage.image = post.postImage
            cell.cellIdentifier?.text = post.clubIdentifier
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            cell.cellDate?.text = dateFormatter.string(from: post.postDa)
        }
        
        return cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let destinationViewController = segue.destination as? ClubInformationViewController {
            destinationViewController.selectedClub = selectedClub
        }
    }
    

}
