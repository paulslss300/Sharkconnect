//
//  MoreViewController.swift
//  IDK
//
//  Created by Paul Tang on 2018-05-05.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var notesCollectionView: UICollectionView!
    @IBOutlet weak var slideMenu: UIView!
    @IBOutlet weak var slideMenuLeading: NSLayoutConstraint!
    
    var selectedNote: Note? = nil
    
    var slideMenuShowing: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notesCollectionView.delegate = self
        notesCollectionView.dataSource = self
        
        slideMenu.layer.shadowOpacity = 1
        slideMenu.layer.shadowRadius = 6
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        notesCollectionView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func newNote(_ sender: Any) {
        let newNote = Note(noteDe: "")
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
        return noteList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "notecells", for: indexPath) as! MoreCollectionViewCell
        
        let note = noteList[indexPath.row]
        cell.noteContent.text? = note.noteDe
        
        return cell
        
    }

    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? CreateNoteViewController {
            destinationViewController.selectedNote = selectedNote
     }
    }
    
}
