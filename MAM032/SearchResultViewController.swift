//
//  SV2ViewController.swift
//  MAM032
//
//  Created by Therese Kustvall Larsson on 27/11/16.
//  Copyright © 2016 test. All rights reserved.
//

import Foundation
import UIKit

class SearchResultViewController: UITableViewController, UIViewControllerTransitioningDelegate, SearchDidChangeDelegate {
    
    var receivedString = ""
    var receivedCity1 = ""
    var receivedCity2 = ""
    var times = [String]()
    var prices = [String]()
    var identities = [String]()
    
    @IBOutlet var editButton: UIBarButtonItem!
    
    var city1ToPass:String!
    var city2ToPass:String!
    var dateString: String!

    
    let transition = CircularTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.navigationController?.isNavigationBarHidden = false
        times = [receivedString, receivedString, receivedString, receivedString]
        identities = ["hakanPushSegue", "miaPushSegue", "erikPushSegue", "annikaPushSegue"]
        prices = ["230 kr", "300 kr", "340 kr", "150 kr"]
        SearchManager.instance.delegate = self
        
    }
    
    func update() {
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        SearchManager.instance.animalAllowed = false
        SearchManager.instance.gender = .none
    }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if(segue.identifier == "hakanPushSegue"){
        let hakanTVC = segue.destination as! HakanTravelViewController
        hakanTVC.city1 = city1ToPass
        hakanTVC.city2 = city2ToPass
        hakanTVC.dateString = dateString
        
    }else if (segue.identifier == "miaPushSegue"){
        let miaTVC = segue.destination as! MiaTravelViewController
        miaTVC.city1 = city1ToPass
        miaTVC.city2 = city2ToPass
        miaTVC.dateString = dateString
        
    }else if (segue.identifier == "erikPushSegue"){
        let erikTVC = segue.destination as! ErikTravelViewController
        erikTVC.city1 = city1ToPass
        erikTVC.city2 = city2ToPass
        erikTVC.dateString = dateString
        
    }else if (segue.identifier == "annikaPushSegue"){
        let annikaTVC = segue.destination as! AnnikaTravelViewController
        annikaTVC.city1 = city1ToPass
        annikaTVC.city2 = city2ToPass
        annikaTVC.dateString = dateString
    }else{
    
        let secondVC = segue.destination as! FilterViewController
        secondVC.transitioningDelegate = self
        secondVC.modalPresentationStyle = .custom
    
        }
    }
 
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = CGPoint(x:335, y:45)
        
              
        
        return transition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = CGPoint(x:335, y:45)
        return transition
    }


    
 
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(SearchManager.instance.animalAllowed){
            return 3
        }
        if(SearchManager.instance.gender == .man){
            return 1
        }
        
        return 4
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "journeyCell", for: indexPath) as! JourneyCell
            cell.setData(fromto: receivedCity1 +  "-"  + receivedCity2 , date: times[indexPath.row], price: prices[indexPath.row])
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
        city1ToPass = receivedCity1
        city2ToPass = receivedCity2
        dateString = receivedString
        performSegue(withIdentifier: pushName, sender: self)
        
    }
    
        
    }
    


    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
