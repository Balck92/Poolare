//
//  ErikProfileViewController.swift
//  MAM032
//
//  Created by Therese Kustvall Larsson on 09/12/16.
//  Copyright © 2016 test. All rights reserved.
//

import Foundation
import UIKit

class ErikProfileViewController: UIViewController {
    
    
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var numberView: UIView!
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        print("5")
        super.viewDidLoad()
        addEmailViewTapRecpognizer()
        addNumberViewTapRecpognizer()
        setViewProperties()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    private func setViewProperties(){
        self.view.layoutIfNeeded()
        profilePictureImageView.layer.cornerRadius = profilePictureImageView.frame.width / 2
        profilePictureImageView.clipsToBounds = true
    }
    
    
    
}



//Tap recon for rating views
extension ErikProfileViewController {
    
    func addRatingTapRecpognizer(){
        ratingView.isUserInteractionEnabled = true
        let aSelector : Selector = #selector(ErikProfileViewController.ratingViewTapped)
        let tapGesture = UITapGestureRecognizer(target: self, action: aSelector)
        tapGesture.numberOfTapsRequired = 1
        ratingView.addGestureRecognizer(tapGesture)
        
        
    }
    
    func ratingViewTapped(){
        //rating window pop up
        self.showAlert("Rating", message: "Betygsätt denna förare:")
        
        
    }
    
    
}


//Tap recon for email and phone number view
extension ErikProfileViewController {
    
    func addEmailViewTapRecpognizer(){
        emailView.isUserInteractionEnabled = true
        let aSelector : Selector = #selector(ErikProfileViewController.emailViewTapped)
        let tapGesture = UITapGestureRecognizer(target: self, action: aSelector)
        tapGesture.numberOfTapsRequired = 1
        emailView.addGestureRecognizer(tapGesture)
    }
    
    func emailViewTapped(){
        self.showAlert("Maila", message: "Vill du maila " + emailLabel.text!  + " ?")     }
    
    func addNumberViewTapRecpognizer(){
        numberView.isUserInteractionEnabled = true
        let aSelector : Selector = #selector(ErikProfileViewController.numberViewTapped)
        let tapGesture = UITapGestureRecognizer(target: self, action: aSelector)
        tapGesture.numberOfTapsRequired = 1
        numberView.addGestureRecognizer(tapGesture)
    }
    
    func numberViewTapped(){
        self.showAlert("Ring", message: "Vill du ringa " + phoneNumberLabel.text!  + " ?")    }
    
}

