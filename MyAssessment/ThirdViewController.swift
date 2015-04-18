//
//  ThirdViewController.swift
//  MyAssessment
//
//  Created by schystz on 4/18/15.
//  Copyright (c) 2015 schystz. All rights reserved.
//

import UIKit

class ThirdViewController: UITableViewController {
    
    var items = [NSDate]()
    var formatter: NSDateFormatter!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let calendar = NSCalendar.currentCalendar()
        let date = NSDate()
        let components = calendar.components(NSCalendarUnit.YearCalendarUnit | NSCalendarUnit.MonthCalendarUnit | NSCalendarUnit.DayCalendarUnit, fromDate: date)
        
        var i = 0
        while (i++ < 12) {
            if let generatedDate = calendar.dateFromComponents(components) {
                self.items.append(generatedDate)
            }
            
            components.day = components.day + 1
        }
        
        self.formatter = NSDateFormatter()
        self.formatter.dateFormat = "dd MMMM YYYY"
    }
    
    // MARK: TableView DataSource
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BasicCell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = self.formatter.stringFromDate(self.items[indexPath.row])
        return cell
    }

}
