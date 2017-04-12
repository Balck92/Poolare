//
//  SignUpViewController.swift
//  MAM032
//
//  Created by Michal Stypa on 2016-11-12.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet var firstnameTextField: UITextField!
    
    @IBOutlet var lastnameTextField: UITextField!
    
    @IBOutlet weak var birthdateTextField: UITextField!
    
    @IBOutlet weak var genderControl: UISegmentedControl!
    
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var phonenumberTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var confirmpasswordTextField: UITextField!
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    @IBOutlet weak var signUpButtonOutlet: UIButton!


    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    @IBAction func signUpButtonPressed(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstnameTextField.delegate = self
        lastnameTextField.delegate = self
        birthdateTextField.delegate = self
        emailTextField.delegate = self
        phonenumberTextField.delegate = self
        passwordTextField.delegate = self
        confirmpasswordTextField.delegate = self
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard)))
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
        setViewProperties()
        firstnameTextField.becomeFirstResponder()
        firstnameTextField.tag = 1
        lastnameTextField.tag = 2
        birthdateTextField.tag = 3
        emailTextField.tag = 4
        phonenumberTextField.tag = 5
        passwordTextField.tag = 6
        confirmpasswordTextField.tag = 7

        // Do any additional setup after loading the view.
    }
    func dismissKeyboard(){
        firstnameTextField.resignFirstResponder()
        lastnameTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        phonenumberTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        confirmpasswordTextField.resignFirstResponder()
        birthdateTextField.resignFirstResponder()
    }
    
    private func setViewProperties(){
        signUpButtonOutlet.layer.cornerRadius = 5
        signUpButtonOutlet.layer.masksToBounds = true
    }
    
    
    
    
    func displayMyAlertMessage(userTitle:String, userMessage:String){
        let myAlert = UIAlertController(title: userTitle, message:userMessage, preferredStyle: UIAlertControllerStyle.alert);
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default, handler:nil);
        myAlert.addAction(okAction)
        self.present(myAlert, animated:true, completion:nil)
    }
    
    
     @IBAction func register_click(_ sender: Any) {
        
        if firstnameTextField.text!.isEmpty || lastnameTextField.text!.isEmpty || emailTextField.text!.isEmpty || phonenumberTextField.text!.isEmpty || passwordTextField.text!.isEmpty || confirmpasswordTextField!.text!.isEmpty || birthdateTextField.text!.isEmpty {
            
            //redplaceholders
            firstnameTextField.attributedPlaceholder = NSAttributedString(string: "Förnamn saknas", attributes: [NSForegroundColorAttributeName: UIColor.red])
            lastnameTextField.attributedPlaceholder = NSAttributedString(string: "Efternamn saknas", attributes: [NSForegroundColorAttributeName: UIColor.red])
            emailTextField.attributedPlaceholder = NSAttributedString(string: "Email saknas", attributes: [NSForegroundColorAttributeName: UIColor.red])
            phonenumberTextField.attributedPlaceholder = NSAttributedString(string: "Telefonnummer saknas", attributes: [NSForegroundColorAttributeName: UIColor.red])
            passwordTextField.attributedPlaceholder = NSAttributedString(string: "Lösenord saknas", attributes: [NSForegroundColorAttributeName: UIColor.red])
            confirmpasswordTextField.attributedPlaceholder = NSAttributedString(string: "Bekräftat lösenord saknas", attributes: [NSForegroundColorAttributeName: UIColor.red])
            birthdateTextField.attributedPlaceholder = NSAttributedString(string: "Födelsedatum saknas", attributes: [NSForegroundColorAttributeName: UIColor.red])
            displayMyAlertMessage(userTitle: "Varning", userMessage: "Du har inte fyllt i samtliga fält")
            
        
        }
        if(passwordTextField.text != confirmpasswordTextField.text){
            displayMyAlertMessage(userTitle: "Varning",userMessage: "Lösenord matchas inte!")
            return
            
        }
        
        
        else{
            
            //create new user in MySQL
            let url = NSURL(string: "http://178.62.34.104/CarPoolers/registerSam.php")
            let request = NSMutableURLRequest(url: (url as! URL))
            request.httpMethod = "POST"
            let body = "firstname=\(firstnameTextField.text!)&lastname=\(lastnameTextField.text!)&email=\(emailTextField.text!)&phoneNbr=\(phonenumberTextField.text!)&password=\(passwordTextField.text!)"
            request.httpBody = body.data(using: String.Encoding.utf8);
            
            
            //proced request
            URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data:Data?, response:URLResponse?, error:Error?) in
                
                if error == nil {
                    
                    // communicate back to UI
                    
                    DispatchQueue.main.async(execute: {
                        
                        do {
                            
                            let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions .mutableContainers) as?
                            NSDictionary
                            
                            guard let parseJSON = json else {
                                
                                print ("Error while parsing")
                                return
                            }
                            
                            let id = parseJSON["id"]
                            
                            if id != nil {
                                
                                print (parseJSON)
                            }
                            
                        } catch {
                            
                            print ("catch an error: \(error)")
                        }
                        
                    })
                    
                }else {
                    
                    print ("error: \(error)")
                }
                
                // very importent to lunch
            }).resume()
            displayMyAlertMessage(userTitle: "Grattis",userMessage: "Du har nu skapat ett konto!")

            
            
            
        }
        
    }
    
    func keyboardWillShow(notification:NSNotification){
        //give room at the bottom of the scroll view, so it doesn't cover up anything the user needs to tap
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        self.scrollView.contentInset = contentInset
    }
    
    func keyboardWillHide(notification:NSNotification){
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        self.scrollView.contentInset = contentInset
    }
}

        
extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(textField.tag == 1){
            firstnameTextField.resignFirstResponder()
            lastnameTextField.becomeFirstResponder()
        }
        if(textField.tag == 2){
            lastnameTextField.resignFirstResponder()
            birthdateTextField.becomeFirstResponder()
        }
        if(textField.tag == 3){
            birthdateTextField.resignFirstResponder()
        }
        if(textField.tag == 4){
            emailTextField.resignFirstResponder()
            phonenumberTextField.becomeFirstResponder()
        }
        if(textField.tag == 5){
            phonenumberTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        }
        
        if(textField.tag == 6){
            passwordTextField.resignFirstResponder()
            confirmpasswordTextField.becomeFirstResponder()
        }
        textField.resignFirstResponder()
        return true
    }

}



