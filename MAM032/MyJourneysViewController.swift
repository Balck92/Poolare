//
//  MyJourneysViewController.swift
//  MAM032
//
//  Created by Michal Stypa on 2016-11-07.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit

class MyJourneysViewController: UITableViewController {
    
    var cities1 = [String]()
    var cities2 = [String]()
    var dates = [String]()
    var prices = [String]()
    var identities = [String]()
    var city1ToPass:String!
    var city2ToPass:String!
    var dateString: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        cities1 = ["Eksjö", "Lund"]
        cities2 = ["Härnösand", "Stockholm"]
        dates = ["2017-01-01", "2017-02-14"]
        prices = ["150 kr", "230 kr"]
        identities = ["EksjoHarnosandSegue", "LundStockholmSegue"]
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "journeyCell", for: indexPath) as! JourneyCell
        cell.setData(fromto: cities1[indexPath.row] +  "-"  + cities2[indexPath.row], date: dates[indexPath.row], price: prices[indexPath.row])
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let pushName = identities[indexPath.row]
        city1ToPass = cities1[indexPath.row]
        city2ToPass = cities2[indexPath.row]
        dateString = dates[indexPath.row]
        performSegue(withIdentifier: pushName, sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "LundStockholmSegue"){
            let lundTVC = segue.destination as! MyJourneyTravelView1
            lundTVC.city1 = city1ToPass
            lundTVC.city2 = city2ToPass
            lundTVC.dateString = dateString
            
        }else if (segue.identifier == "EksjoHarnosandSegue"){
            let eksjoTVC = segue.destination as! MyJourneyTravelView2
            eksjoTVC.city1 = city1ToPass
            eksjoTVC.city2 = city2ToPass
            eksjoTVC.dateString = dateString
        }
    }
}
    
  
