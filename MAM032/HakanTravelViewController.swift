//
//  HakanTravelViewController.swift
//  MAM032
//
//  Created by Therese Kustvall Larsson on 08/12/16.
//  Copyright © 2016 test. All rights reserved.
//

import Foundation
import UIKit

class HakanTravelViewController: UIViewController {
   
    var city1 = ""
    var city2 = ""
    var dateString = ""
    @IBOutlet weak var driverView: UIView!
 
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBAction func button(_ sender: Any) {
            book()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityLabel.text = city1 + " - " + city2
        dateLabel.text = dateString + ", 11.00"
        
      switch (city1){
        case "Gävle":
            image.image = UIImage(named: "gavle-goteborg")
            break
        case "gävle":
            image.image = UIImage(named: "gavle-goteborg")
            break
        case "Eksjö":
            image.image = UIImage(named: "eksjo-harnosand")
            break
        case "eksjö":
            image.image = UIImage(named: "eksjo-harnosand")
            break
        case "Lund":
            image.image = UIImage(named: "Lund-stockholm")
            break
        case "lund":
            image.image = UIImage(named: "Lund-stockholm")
            break
        default: break
        }
        addViewTapRecognizer()
        
        // Do any additional setup after loading the view.
    }
    
func book(){
    //Boka resa
    self.showAlert("Resan har bokats!", message: "Du hittar din resa under Mina resor")
}

}

//Tap recon for from and to-views
extension HakanTravelViewController {
    
    func addViewTapRecognizer(){
        print("1")
        driverView.isUserInteractionEnabled = true
        let aSelector : Selector = #selector(HakanTravelViewController.driverViewTapped)
        let tapGesture = UITapGestureRecognizer(target: self, action: aSelector)
        tapGesture.numberOfTapsRequired = 1
        driverView.addGestureRecognizer(tapGesture)
        
    }
    
    func driverViewTapped(){
        
        self.performSegue(withIdentifier: "hakanSegue", sender: nil)
        }
    
}
