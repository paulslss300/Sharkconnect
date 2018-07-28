//
//  MoreViewController.swift
//  IDK
//
//  Created by Paul Tang on 2018-05-05.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var noteTableView: UITableView!
    @IBOutlet weak var slideMenu: UIView!
    @IBOutlet weak var slideMenuLeading: NSLayoutConstraint!
    
    var selectedNote: Note? = nil
    
    var slideMenuShowing: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noteTableView.delegate = self
        noteTableView.dataSource = self
        
        slideMenu.layer.shadowOpacity = 1
        slideMenu.layer.shadowRadius = 6
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        noteTableView.reloadData()
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func newNote(_ sender: Any) {
        
        let today = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let result = formatter.string(from: today)

        let date = Date()
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        
        let time = result + "-" + String(format: "%02d", hour) + "-" + String(format: "%02d", minutes) + "-" + String(format: "%02d", seconds)
        
        let newNote = Note(noteDe: "", timeCreated: time, isHomework: false)
        noteList += [newNote]

        selectedNote = newNote
        performSegue(withIdentifier: "shownote", sender: self)
    }
    
    @IBAction func slideMenuButton(_ sender: Any) {
        if slideMenuShowing {
            slideMenuLeading.constant = -260
            UIView.animate(withDuration: 0.2,
                           animations: {
                            self.view.layoutIfNeeded()
            })
        } else {
            slideMenuLeading.constant = 0
            UIView.animate(withDuration: 0.4,
                           animations: {
                            self.view.layoutIfNeeded()
            })
        }
        slideMenuShowing = !slideMenuShowing
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return noteList.count
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let note = noteList[indexPath.row]
        selectedNote = note
        performSegue(withIdentifier: "shownote", sender: self)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: MoreTableViewCell = tableView.dequeueReusableCell(withIdentifier: "notecells", for: indexPath) as? MoreTableViewCell {
        
        cell.dot.layer.cornerRadius = 10
        cell.dot.layer.masksToBounds = true
        
        let note = noteList[indexPath.row]
        cell.noteContent.text? = note.noteDe
        if note.isHomework == false {
            cell.dot.isHidden = true
        } else {
            cell.dot.isHidden = false
        }
        
        return cell
            
        } else {
            assertionFailure("Failed to deque cell")
            return UITableViewCell()
        }
    }


    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? CreateNoteViewController {
            destinationViewController.selectedNote = selectedNote
     }
    }
    
}
