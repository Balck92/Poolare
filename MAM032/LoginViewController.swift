//
//  LoginViewController.swift
//  MAM032
//
//  Created by Michal Stypa on 2016-11-12.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButtonOutlet: UIButton!
    
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!
    
    func displayMyAlertMessage(userTitle:String, userMessage:String){
        let myAlert = UIAlertController(title: userTitle, message:userMessage, preferredStyle: UIAlertControllerStyle.alert);
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default, handler:nil);
        myAlert.addAction(okAction)
        self.present(myAlert, animated:true, completion:nil)
    }

    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        
        if emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty{
            
            //red placeholders
            emailTextField.attributedPlaceholder = NSAttributedString(string: "Email saknas", attributes: [NSForegroundColorAttributeName: UIColor.red])
            passwordTextField.attributedPlaceholder = NSAttributedString(string: "Lösenord saknas", attributes: [NSForegroundColorAttributeName: UIColor.red])
            displayMyAlertMessage(userTitle: "Varning", userMessage: "Du har inte fyllt i samtliga fält")

        
        
        }else{
            let url = NSURL(string: "http://178.62.34.104/CarPoolers/loginSam.php")
            let request = NSMutableURLRequest(url: (url as! URL))
            request.httpMethod = "POST"
            let postString = "email=\(emailTextField.text!)&password=\(passwordTextField.text!)";
            request.httpBody = postString.data(using: String.Encoding.utf8);
            
            
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
            
            
            
    

            
        }
        
        
    }
    
 
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard)))
        emailTextField.delegate = self
        passwordTextField.delegate = self
        emailTextField.tag = 1
        setViewProperties()

        
        // Do any additional setup after loading the view.
    }
    func dismissKeyboard(){
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    private func setViewProperties(){
        loginButtonOutlet.layer.cornerRadius = 5
        loginButtonOutlet.layer.masksToBounds = true
    }


}

extension LoginViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(textField.tag == 1){
            emailTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else {
            passwordTextField.resignFirstResponder()
            
            loginButtonOutlet.sendActions(for: .touchUpInside)
            //TRYCK PÅ LOGGA IN
        }
        
        return true
    }

}
