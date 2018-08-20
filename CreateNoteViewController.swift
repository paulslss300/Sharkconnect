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
    @IBOutlet weak var dateField: UITextField!
    
    var selectedNote: Note? = nil
    lazy var tempDate: String = self.selectedNote!.noteDa!
    
    let picker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        noteContent.text = selectedNote?.noteDe
        dateField.text = selectedNote?.noteDa
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
        
        guard let timeCreated = selectedNote?.timeCreated else {
            return
        }
        
        for note in noteList {
            if timeCreated == note.timeCreated {
                noteList = noteList.filter({ (note) -> Bool in
                    return !(note.timeCreated == timeCreated)
                })
            }
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveNote(_ sender: Any) {
        if !noteContent.text.trimmingCharacters(in: .whitespaces).isEmpty {
            selectedNote?.noteDe = noteContent.text
            selectedNote?.noteDa = tempDate
            self.view.endEditing(true)
        } else {
            deleteNote(self)
            _ = navigationController?.popViewController(animated: true)
        }
    }
    
    func createDatePicker(){
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //done button for the toolbar
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([done], animated: false)
        
        dateField.inputAccessoryView = toolbar
        dateField.inputView = picker
        
        //format picker for date
        picker.datePickerMode = .date
    }
    
    @objc func donePressed(){
        //format date
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        let dateString = formatter.string(from: picker.date)
        
        formatter.dateFormat = "yyyy-MM-dd"
        tempDate = formatter.string(from: picker.date)
        
        dateField.text = "\(dateString)"
        self.view.endEditing(true)
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
