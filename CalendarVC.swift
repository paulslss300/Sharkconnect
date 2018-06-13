//  CalendarViewController.swift
//  calendarTest
//
//  Created by Guest User on 2018-03-07.
//  Copyright © 2018 Guest User. All rights reserved.
//

import UIKit

class CalendarVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    
    //, UITableViewDataSource, UITableViewDelegate
    
    @IBOutlet weak var displayText: UILabel!
    
    @IBOutlet weak var calendarTable: UITableView!
    
    @IBOutlet weak var calendarView: UICollectionView!
    
    var monthIndex: Int = 1
    var yearIndex: Int = 1
    var finalMonthIndex: String = ""
    var result: String = ""
    var datePicked: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarTable.delegate = self
        calendarTable.dataSource = self
        
        calendarView.delegate  = self
        calendarView.dataSource = self
        let itemSize = UIScreen.main.bounds.width/7 - 7
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsetsMake(2, 3, 1, 2)
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        
        calendarView.collectionViewLayout = layout
        
        // Do any additional setup after loading the view.
        // get the current date
        let today = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        result = formatter.string(from: today)
        
        // year value to int
        let indexOfYear = result.index(result.endIndex, offsetBy: -6)
        yearIndex = Int(result.substring(to: indexOfYear))!   //yyyy
        
        // month value to int
        let indexofMonth1 = result.index(result.startIndex, offsetBy: 5)
        let indexofMonth2 = result.index(result.endIndex, offsetBy: -3)
        monthIndex = Int(result.substring(with: indexofMonth1..<indexofMonth2))!
        finalMonthIndex = String(format: "%02d", monthIndex)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        calendarView.reloadData()
        calendarTable.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        displayedPosts.removeAll()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func nextMonth(_ sender: Any) {
        if monthIndex < 12 {
            monthIndex += 1
        } else {
            yearIndex += 1
            monthIndex = 1
        }
        finalMonthIndex = String(format: "%02d", monthIndex)
        
        for i in selectedMonth.indices {
            selectedMonth[i] = ""
        }
        calendarView.reloadData()
        
    }
    
    @IBAction func lastMonth(_ sender: Any) {
        if monthIndex > 1 {
            monthIndex -= 1
        } else {
            yearIndex -= 1
            monthIndex = 12
        }
        finalMonthIndex = String(format: "%02d", monthIndex)
        
        for i in selectedMonth.indices {
            selectedMonth[i] = ""
        }
        calendarView.reloadData()
        
    }
    
    func getDayOfWeekFunc(today:String)->Int? {
        
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let todayDate = formatter.date(from: today) {
            let myCalendar = Calendar(identifier: .gregorian)
            let myComponents = myCalendar.component(.weekday, from: todayDate)
            let weekDay = myComponents
            return weekDay
        }
        return nil
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        displayedPosts = []
        
        let date = collectionView.cellForItem(at: indexPath)
        
        if selectedMonth[indexPath.row] != "" {
            let checkDate =  String(format: "%02d", Int(selectedMonth[indexPath.row])!)
            date?.backgroundColor = UIColor.red
            
            // this is the actual date picked
            let indexOfDatePicked = result.index(result.endIndex, offsetBy: -2)
            datePicked = result.substring(to: indexOfDatePicked) + checkDate
            
            for post in subscribedPosts {
                
                // get the date value for NSDate object
                let indexOfDate = String(describing: post.postDa!).index(String(describing: post.postDa!).endIndex, offsetBy: -15)
                
                if datePicked == String(describing: post.postDa!).substring(to: indexOfDate) {
                    displayedPosts += [post]
                }
            }
        }
        calendarTable.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let date = collectionView.cellForItem(at: indexPath)
        date?.backgroundColor = UIColor.clear
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedMonth.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCollection", for: indexPath) as! CalendarCVCell
        
        cell.backgroundColor = UIColor.clear
        cell.image.isHidden = true
        cell.image.layer.cornerRadius = 7.25
        cell.image.layer.masksToBounds = true
        
        
        // update result
        result = String(yearIndex) + "-" + finalMonthIndex + "-01"
        
        // displaying year & month
        displayText.text = result
        let displayTextIndex = result.index(result.endIndex, offsetBy: -3)
        displayText.text = result.substring(to: displayTextIndex)
        
        // get today's day in a week
        var weekday = getDayOfWeekFunc(today: result)
        if weekday! == 7 {
            weekday! = 1
        }
        
        // get the # of days in a given month & year
        let dateComponents = DateComponents(year: yearIndex
            , month: monthIndex)
        let calendar = Calendar.current
        let date = calendar.date(from: dateComponents)!
        let range = calendar.range(of: .day, in: .month, for: date)!
        let numDays: Int = range.count
        
        
        
        //add dates to selectedMonth array
        var day: Int = 1
        while day <= numDays {
            selectedMonth[weekday! - 1] = String(day)
            weekday! += 1
            day += 1
        }
        
        let dates = selectedMonth[indexPath.row]
        cell.number?.text = dates
        
        // Highlight allthe events
        for checkCell in [cell] as [CalendarCVCell] {
            for checkPost in subscribedPosts {
                
                // get the date value for NSDate object
                let indexOfDate = String(describing: checkPost.postDa!).index(String(describing: checkPost.postDa!).endIndex, offsetBy: -15)
                
                if checkCell.number.text! == "" {
                    checkCell.image.isHidden = true
                } else if displayText.text! + "-" + String(format: "%02d", Int(checkCell.number.text!)!) == String(describing: checkPost.postDa!).substring(to: indexOfDate) {
                    checkCell.image.isHidden = false
                }
            }
        }
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedPosts.count
    }
    
    /*
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     //let club = subscribedClubs[indexPath.row]
     //selectedClub = club
     //performSegue(withIdentifier: "showclubinformationthroughuser", sender: self)
     }
     */
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CalendarTVCell = tableView.dequeueReusableCell(withIdentifier: "CalendarTable", for: indexPath) as! CalendarTVCell
        
        let postsToDisplay = displayedPosts[indexPath.row]
        
        // Configure the cell...
        //cell.clubImage.image = subscribedClub.ClubCellImageName
        //cell.clubName?.text = subscribedClub.ClubNa
        cell.clubName?.text = postsToDisplay.clubIdentifier
        cell.postDescription?.text = postsToDisplay.postTi
        
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


