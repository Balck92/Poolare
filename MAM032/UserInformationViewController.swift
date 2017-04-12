//
//  UserInformationViewController.swift
//  MAM032
//
//  Created by Therese Kustvall Larsson on 17/11/16.
//  Copyright © 2016 test. All rights reserved.
//

import Foundation
import UIKit


class UserInformationViewController: UIViewController {

    @IBOutlet weak var firstnameLabel: UILabel!
    @IBOutlet weak var lastnameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
  
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var lastnameField: UITextField!
    @IBOutlet weak var firstnameField: UITextField!
    @IBOutlet weak var firstnameView: UIView!
    @IBOutlet weak var lastnameView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var numberView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBAction func saveButton(_ sender: Any) {
        save()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        addViewTapRecpognizer()
        
    }
    func save(){
        //Bspara
        self.showAlert("Klar!", message: "Dina uppgifter har sparats.")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        firstnameField.delegate = self
        lastnameField.delegate = self
        emailField.delegate = self
        numberField.delegate = self
        passwordField.delegate = self
    }
}

//Tap recons
extension UserInformationViewController {
    
    func addViewTapRecpognizer(){
        firstnameView.isUserInteractionEnabled = true
        let aSelector : Selector = #selector(UserInformationViewController.firstnameViewTapped)
        let tapGesture = UITapGestureRecognizer(target: self, action: aSelector)
        tapGesture.numberOfTapsRequired = 1
        firstnameView.addGestureRecognizer(tapGesture)
        
        lastnameView.isUserInteractionEnabled = true
        let aSelector2 : Selector = #selector(UserInformationViewController.lastnameViewTapped)
        let tapGesture2 = UITapGestureRecognizer(target: self, action: aSelector2)
        tapGesture2.numberOfTapsRequired = 1
        lastnameView.addGestureRecognizer(tapGesture2)
        
        emailView.isUserInteractionEnabled = true
        let aSelector3 : Selector = #selector(UserInformationViewController.emailViewTapped)
        let tapGesture3 = UITapGestureRecognizer(target: self, action: aSelector3)
        tapGesture3.numberOfTapsRequired = 1
        emailView.addGestureRecognizer(tapGesture3)
        
        numberView.isUserInteractionEnabled = true
        let aSelector4 : Selector = #selector(UserInformationViewController.numberViewTapped)
        let tapGesture4 = UITapGestureRecognizer(target: self, action: aSelector4)
        tapGesture4.numberOfTapsRequired = 1
        numberView.addGestureRecognizer(tapGesture4)
        
        passwordView.isUserInteractionEnabled = true
        let aSelector5 : Selector = #selector(UserInformationViewController.passwordViewTapped)
        let tapGesture5 = UITapGestureRecognizer(target: self, action: aSelector5)
        tapGesture5.numberOfTapsRequired = 1
        passwordView.addGestureRecognizer(tapGesture5)
        
    }
    
    func firstnameViewTapped(){
        firstnameLabel.alpha = 0
        firstnameField.alpha = 1
        firstnameField.text = firstnameLabel.text
        firstnameField.isUserInteractionEnabled = true
        firstnameField.becomeFirstResponder()
        firstnameField.selectedTextRange = firstnameField.textRange(from: firstnameField.beginningOfDocument, to: firstnameField.endOfDocument)
    }
    
    func lastnameViewTapped(){
        lastnameLabel.alpha = 0
        lastnameField.alpha = 1
        lastnameField.text = lastnameLabel.text
        lastnameField.isUserInteractionEnabled = true
        lastnameField.becomeFirstResponder()
        lastnameField.selectedTextRange = lastnameField.textRange(from: lastnameField.beginningOfDocument, to: lastnameField.endOfDocument)
    }
    
    func emailViewTapped(){
        emailLabel.alpha = 0
        emailField.alpha = 1
        emailField.text = emailLabel.text
        emailField.isUserInteractionEnabled = true
        emailField.becomeFirstResponder()
        emailField.selectedTextRange = emailField.textRange(from: emailField.beginningOfDocument, to: emailField.endOfDocument)
    }

    func numberViewTapped(){
        numberLabel.alpha = 0
        numberField.alpha = 1
        numberField.text = numberLabel.text
        numberField.isUserInteractionEnabled = true
        numberField.becomeFirstResponder()
        numberField.selectedTextRange = numberField.textRange(from: numberField.beginningOfDocument, to: numberField.endOfDocument)
    }

    
    func passwordViewTapped(){
        passwordLabel.alpha = 0
        passwordField.alpha = 1
        passwordField.text = passwordLabel.text
        passwordField.isUserInteractionEnabled = true
        passwordField.becomeFirstResponder()
        passwordField.selectedTextRange = passwordField.textRange(from: passwordField.beginningOfDocument, to: passwordField.endOfDocument)
    }
}
    
    //Price text field delegation
    extension UserInformationViewController: UITextFieldDelegate {
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            
        }
        
        func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
            return true
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            textField.alpha = 0
            switch (textField){
            
            case(firstnameField):
                firstnameLabel.text = firstnameField.text
                firstnameLabel.alpha = 1
            
            case(lastnameField):
                lastnameLabel.text = lastnameField.text
                lastnameLabel.alpha = 1
                
            case(emailField):
                emailLabel.text = emailField.text
                emailLabel.alpha = 1
                
            case(numberField):
                numberLabel.text = numberField.text
                numberLabel.alpha = 1
            
            case(passwordField):
                passwordLabel.text = passwordField.text
                passwordLabel.alpha = 1
            
            default:
                ()
                
            }
            
            textField.isUserInteractionEnabled = false
           
            return true
       }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissBoard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissBoard() {
        view.endEditing(true)
    }
}

