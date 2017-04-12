//
//  MyProfileViewController.swift
//  MAM032
//
//  Created by Therese Kustvall Larsson on 17/11/16.
//  Copyright © 2016 test. All rights reserved.
//

import Foundation

import UIKit


class MyProfileViewController: UIViewController {
    
    @IBOutlet weak var userInformation: UIView!
    
    @IBOutlet weak var myTravels: UIView!
    
    @IBOutlet weak var profilePictureImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViewTapRecognizer()
        setViewProperties()

    }
    
    private func setViewProperties(){
        self.view.layoutIfNeeded()
        profilePictureImageView.layer.cornerRadius = profilePictureImageView.frame.width / 2
        profilePictureImageView.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}


    //Tap recon for from and to-views
extension MyProfileViewController {
    
    func addViewTapRecognizer(){
        userInformation.isUserInteractionEnabled = true
        let aSelector : Selector = #selector(MyProfileViewController.userInformationViewTapped)
        let tapGesture = UITapGestureRecognizer(target: self, action: aSelector)
        tapGesture.numberOfTapsRequired = 1
        userInformation.addGestureRecognizer(tapGesture)
        
        myTravels.isUserInteractionEnabled = true
        let aSelector2 : Selector = #selector(MyProfileViewController.myTravelsViewTapped)
        let tapGesture2 = UITapGestureRecognizer(target: self, action: aSelector2)
        tapGesture2.numberOfTapsRequired = 1
        myTravels.addGestureRecognizer(tapGesture2)
    }
    
    func userInformationViewTapped(){
       
        let secondViewController = (self.storyboard?.instantiateViewController(withIdentifier: "UserInformationViewController"))! as UIViewController
        self.navigationController?.pushViewController(secondViewController, animated: true)    }
    

    
    func myTravelsViewTapped(){
        
        let secondViewController = (self.storyboard?.instantiateViewController(withIdentifier: "MyTravelsViewController"))! as UIViewController
        self.navigationController?.pushViewController(secondViewController, animated: true)
    
    
    
    
        
    }
}
