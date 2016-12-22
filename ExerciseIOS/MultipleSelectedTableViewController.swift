//
//  MultipleSelectedTableViewController.swift
//  ExerciseIOS
//
//  Created by Song Seaktheng on 12/20/16.
//  Copyright © 2016 Song Seaktheng. All rights reserved.
//

import UIKit

struct identity {
    var isCheck : Bool = false
}

class MultipleSelectedTableViewController: UITableViewController, UISearchBarDelegate {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    var selectedRows = [Int]()
    var filteredData: [String] = []
    var searchActive : Bool = false
    
    let items = [
        "Apple",
        "Apricot",
        "Avocado",
        "Banana",
        "Bilberry",
        "Blackberry",
        "Blackcurrant",
        "Blueberry",
        "Boysenberry",
        "Currant",
        "Cherry",
        "Cherimoya",
        "Cloudberry",
        "Coconut",
        "Cranberry",
        "Cucumber",
        "Custard apple",
        "Damson",
        "Date",
        "Decaisnea Fargesii",
        "Dragonfruit",
        "Durian",
        "Elderberry"
    
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
//        filteredData = items

        
            }
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    // MARK: - Table view data source

    @IBAction func countButton(_ sender: UIBarButtonItem) {
        
        let countAlert = UIAlertController(title: "Count", message: "You have selected \(selectedRows.count) items", preferredStyle: UIAlertControllerStyle.alert)
        countAlert.addAction(UIAlertAction(title:"OK", style: .default, handler:{(action:UIAlertAction!) in
        }))
        present(countAlert, animated: true, completion: nil)
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
   
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchActive){
            return filteredData.count
        }
        return items.count
    
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCell", for: indexPath)
        

        if(searchActive){
        
            if selectedRows.count > 0 {
            selectedRows.contains(indexPath.row) ? (cell.accessoryType = .checkmark) : (cell.accessoryType = .none)
            }
            cell.textLabel?.text = filteredData[indexPath.row]
        }else{
             cell.textLabel?.text = items[indexPath.row]
        }

        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = selectedRows.index(of: indexPath.row)
        
        if let i = index, i>=0{
            let cell =  tableView.cellForRow(at: indexPath)
//            cell?.backgroundColor = UIColor.white
            cell?.accessoryType = .none
            selectedRows.remove(at: i)
            
        }else{
            let cell = tableView.cellForRow(at: indexPath)
             cell?.accessoryType = .checkmark
//            cell?.backgroundColor = UIColor.red
//            cell?.backgroundView?.backgroundColor = UIColor.red
            selectedRows.append(indexPath.row)
        }
    }
    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        filteredData = searchText.isEmpty ? items : items.filter({(dataString: String) -> Bool in
//            
//            
//           
//            return dataString.range(of: searchText, options: .caseInsensitive) != nil
//        })
//        
//        tableView.reloadData()
//    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("========search active=======")
        
        filteredData = items.filter({ (text) -> Bool in
            let tmp: NSString = text as NSString
            let range = tmp.range(of: searchText, options: .caseInsensitive)

            return range.location != NSNotFound
        })
        if(filteredData.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
        self.tableView.reloadData()
    }
   
}
