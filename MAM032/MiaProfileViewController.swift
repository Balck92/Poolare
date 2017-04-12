//
//  MiaProfileViewController.swift
//  MAM032
//
//  Created by Therese Kustvall Larsson on 12/10/16.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit

class MiaProfileViewController: UIViewController {
    
    
    @IBOutlet weak var numberView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var ratingView: CosmosView!

    @IBOutlet weak var myTravelsView: UIView!
    
    override func viewDidLoad() {
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
extension MiaProfileViewController {
    
    func addRatingTapRecpognizer(){
        ratingView.isUserInteractionEnabled = true
        let aSelector : Selector = #selector(MiaProfileViewController.ratingViewTapped)
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
extension MiaProfileViewController {
    
    func addEmailViewTapRecpognizer(){
        emailView.isUserInteractionEnabled = true
        let aSelector : Selector = #selector(MiaProfileViewController.emailViewTapped)
        let tapGesture = UITapGestureRecognizer(target: self, action: aSelector)
        tapGesture.numberOfTapsRequired = 1
        emailView.addGestureRecognizer(tapGesture)
    }
    
    func emailViewTapped(){
   self.showAlert("Maila", message: "Vill du maila " + emailLabel.text!  + " ?")     }
    
    func addNumberViewTapRecpognizer(){
        numberView.isUserInteractionEnabled = true
        let aSelector : Selector = #selector(MiaProfileViewController.numberViewTapped)
        let tapGesture = UITapGestureRecognizer(target: self, action: aSelector)
        tapGesture.numberOfTapsRequired = 1
        numberView.addGestureRecognizer(tapGesture)
    }
    
    func numberViewTapped(){
  self.showAlert("Ring", message: "Vill du ringa " + phoneNumberLabel.text!  + " ?")    }
    
}

