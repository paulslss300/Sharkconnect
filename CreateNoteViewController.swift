//
//  CreateNoteViewController.swift
//  IDK
//
//  Created by Paul Tang on 2018-05-05.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class CreateNoteViewController: UIViewController {

    @IBOutlet weak var noteContent: UITextView!
    
    var selectedNote: Note? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noteContent.text = selectedNote?.noteDe
    }
    
    override func viewWillDisappear(_ _animated : Bool) {
        super.viewWillDisappear(_animated)
        
        if self.isMovingFromParentViewController {
            if noteContent.text.trimmingCharacters(in: .whitespaces).isEmpty {
                deleteNote(self)
            } else {
                saveNote(self)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deleteNote(_ sender: Any) {
        for note in noteList {
            if (selectedNote?.timeCreated)! == note.timeCreated {
                noteList = noteList.filter({ (note) -> Bool in
                    return !(note.timeCreated == selectedNote?.timeCreated)
                })
            }
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveNote(_ sender: Any) {
        if !noteContent.text.trimmingCharacters(in: .whitespaces).isEmpty {
            selectedNote?.noteDe = noteContent.text
            self.view.endEditing(true)
        } else {
            deleteNote(self)
            _ = navigationController?.popViewController(animated: true)
        }
        
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

/* To do:
 3. save when the user leave createNoteVC, also save when the user presses save
 4. add time to Note, use time as an identifier
 */
