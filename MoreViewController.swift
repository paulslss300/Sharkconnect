//
//  MoreViewController.swift
//  IDK
//
//  Created by Paul Tang on 2018-05-05.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var noteCollectionView: UICollectionView!
    @IBOutlet weak var slideMenu: UIView!
    @IBOutlet weak var slideMenuLeading: NSLayoutConstraint!
    
    var selectedNote: Note? = nil
    
    var slideMenuShowing: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noteCollectionView.delegate = self
        noteCollectionView.dataSource = self
        
        slideMenu.layer.shadowOpacity = 1
        slideMenu.layer.shadowRadius = 6
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        noteCollectionView.reloadData()
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func newNote(_ sender: Any) {
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let result = formatter.string(from: date)
        
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date) - 7
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        
        let time = result + "-" + String(format: "%02d", hour) + "-" + String(format: "%02d", minutes) + "-" + String(format: "%02d", seconds)
        
        let newNote = Note(noteDe: "", timeCreated: time, noteDa: nil)
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let note = noteList[indexPath.row]
        selectedNote = note
        performSegue(withIdentifier: "shownote", sender: self)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var numberOfItemsInSection: Int = 0
        if noteList.count > 0 {
            numberOfItemsInSection = noteList.count
            noteCollectionView.backgroundView = nil
        } else {
            let noDataLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: noteCollectionView.bounds.size.width, height: noteCollectionView.bounds.size.height))
            noDataLabel.text = "No notes to be shown"
            noDataLabel.textColor = UIColor.gray
            noDataLabel.textAlignment = .center
            noteCollectionView.backgroundView = noDataLabel
        }
        return numberOfItemsInSection
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "notecells", for: indexPath) as? MoreCollectionViewCell {

            let note = noteList[indexPath.row]
            cell.noteContent.text = note.noteDe
            cell.noteDate.text = note.noteDa
            
            return cell
            
        } else {
            assertionFailure("Failed to deque cell")
            return UICollectionViewCell()
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
