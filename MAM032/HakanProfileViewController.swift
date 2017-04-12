//
//  HakanProfileViewController.swift
//  MAM032
//
//  Created by Therese Kustvall Larsson on 08/12/16.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit

class HakanProfileViewController: UIViewController {
    
    
    @IBOutlet weak var numberView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var profilePictureImageView: UIImageView!
    
    override func viewDidLoad() {
        print("5")
        super.viewDidLoad()
        addEmailViewTapRecpognizer()
        addNumberViewTapRecpognizer()
        setViewProperties()
        
    }

    private func setViewProperties(){
        self.view.layoutIfNeeded()
        profilePictureImageView.layer.cornerRadius = profilePictureImageView.frame.width / 2
        profilePictureImageView.clipsToBounds = true
    }
}



//Tap recon for rating views
extension HakanProfileViewController {
    
    func addRatingTapRecpognizer(){
        ratingView.isUserInteractionEnabled = true
        let aSelector : Selector = #selector(HakanProfileViewController.ratingViewTapped)
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
extension HakanProfileViewController {
    
    func addEmailViewTapRecpognizer(){
        emailView.isUserInteractionEnabled = true
        let aSelector : Selector = #selector(HakanProfileViewController.emailViewTapped)
        let tapGesture = UITapGestureRecognizer(target: self, action: aSelector)
        tapGesture.numberOfTapsRequired = 1
        emailView.addGestureRecognizer(tapGesture)
    }
    
    func emailViewTapped(){
        self.showAlert("Maila", message: "Vill du maila " + emailLabel.text!  + " ?")     }
    
    func addNumberViewTapRecpognizer(){
        numberView.isUserInteractionEnabled = true
        let aSelector : Selector = #selector(HakanProfileViewController.numberViewTapped)
        let tapGesture = UITapGestureRecognizer(target: self, action: aSelector)
        tapGesture.numberOfTapsRequired = 1
        numberView.addGestureRecognizer(tapGesture)
    }
    
    func numberViewTapped(){
        self.showAlert("Ring", message: "Vill du ringa " + phoneNumberLabel.text!  + " ?")    }
    
}

