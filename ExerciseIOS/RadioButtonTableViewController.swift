//
//  RadioButtonTableViewController.swift
//  ExerciseIOS
//
//  Created by Song Seaktheng on 12/20/16.
//  Copyright © 2016 Song Seaktheng. All rights reserved.
//

import UIKit


struct item {
    var isCheck : Bool = false
}

//Radio Button with TableViewController
class RadioButtonTableViewController: UITableViewController {
    
    var items : [item] = [item(),item(),item(),item()]
    
    var selectedRows = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
           }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "radioCell", for: indexPath) as! RadioButtonTableViewCell
        
        
        if items[indexPath.row].isCheck {
            cell.radioImageCell.image = UIImage(named: "pop_radio_on_btn")
        }else {
            cell.radioImageCell.image = UIImage(named: "pop_radio_off_btn")
        }
        return cell
    }
 

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! RadioButtonTableViewCell
        cell.radioImageCell.image = UIImage(named: "pop_radio_on_btn")
        items[indexPath.row].isCheck = true
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? RadioButtonTableViewCell {
            
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! RadioButtonTableViewCell
         cell.radioImageCell.image = UIImage(named:"pop_radio_off_btn")
        items[indexPath.row].isCheck = false
    }
    



}
