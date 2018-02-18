//
//  CalendarViewController.swift
//  IDK
//
//  Created by launchpad on 2018-02-18.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {

    @IBOutlet weak var calendarContainerView: UIView!
    
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        setupCalendar()
    }
    // MARK: - Private properties
    private var calendarView: CalendarView!
  

    
    // MARK: - Private methods
    func setupCalendar() {
        if calendarView == nil {
            //calendarView = calendarView(theme: .dark)   // Can change this to .light or .dark as desired
            calendarView.translatesAutoresizingMaskIntoConstraints = false
            calendarContainerView.addSubview(calendarView)
            calendarView.topAnchor.constraint(equalTo: calendarContainerView.topAnchor, constant: 0).isActive=true
            calendarView.rightAnchor.constraint(equalTo: calendarContainerView.rightAnchor, constant: 0).isActive=true
            calendarView.leftAnchor.constraint(equalTo: calendarContainerView.leftAnchor, constant: 0).isActive=true
            calendarView.bottomAnchor.constraint(equalTo: calendarContainerView.bottomAnchor, constant: 0).isActive=true
        }
    }
}
