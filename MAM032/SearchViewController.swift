//
//  SearchViewController.swift
//  MAM032
//
//  Created by Calle Balck on 2016-10-12.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var fromTextField: UITextField!
    @IBOutlet weak var toTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet var dateLabel: UILabel!

    @IBOutlet var dateView: UIView!
    
    func displayMyAlertMessage(userTitle:String, userMessage:String){
        let myAlert = UIAlertController(title: userTitle, message:userMessage, preferredStyle: UIAlertControllerStyle.alert);
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default, handler:nil);
        myAlert.addAction(okAction)
        self.present(myAlert, animated:true, completion:nil)
    }

    fileprivate var datePicker: UIDatePicker!
    
    @IBAction func search(_ sender: Any) {
        //called when search button is pressed
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDateTimeViewTapRecpognizer()
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let result = formatter.string(from: date)
        dateLabel.text = result
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard)))
        self.navigationController?.isNavigationBarHidden = true
        setViewProperties()
        fromTextField.delegate = self
        toTextField.delegate = self
        fromTextField.tag = 1
        
    }
    func dismissKeyboard(){
        fromTextField.resignFirstResponder()
        toTextField.resignFirstResponder()
    }

    
    
    private func setViewProperties(){
        searchButton.layer.cornerRadius = 5
        searchButton.layer.masksToBounds = true
        dateView.layer.cornerRadius = 5
        dateView.layer.masksToBounds = true
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if fromTextField.text!.isEmpty || toTextField.text!.isEmpty{
            fromTextField.attributedPlaceholder = NSAttributedString(string: "Stad saknas", attributes: [NSForegroundColorAttributeName: UIColor.red])
            toTextField.attributedPlaceholder = NSAttributedString(string: "Stad saknas", attributes: [NSForegroundColorAttributeName: UIColor.red])
            displayMyAlertMessage(userTitle: "Varning", userMessage: "Du har inte fyllt i samtliga fält")
            return
        }
        
        
        let resultVC: SearchResultViewController = segue.destination as! SearchResultViewController
        resultVC.receivedString = dateLabel.text!
        resultVC.receivedCity1 = fromTextField.text!
        resultVC.receivedCity2 = toTextField.text!
    }
    
}
extension SearchViewController {
    func addDateTimeViewTapRecpognizer(){
        dateView.isUserInteractionEnabled = true
        let aSelector : Selector = #selector(AddViewController.dateViewTapped)
        let tapGesture = UITapGestureRecognizer(target: self, action: aSelector)
        tapGesture.numberOfTapsRequired = 1
        dateView.addGestureRecognizer(tapGesture)
    
        
    }
    
    
    func dateViewTapped(){
        let viewDatePicker: UIView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 200))
        viewDatePicker.backgroundColor = UIColor.clear
        
        
        self.datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 200))
        self.datePicker.datePickerMode = UIDatePickerMode.date
        
        datePicker.locale = NSLocale(localeIdentifier: "sv") as Locale
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "yyyy-MM-dd"
        self.datePicker.date = Date()
        
        viewDatePicker.addSubview(self.datePicker)
        
        let alertController = UIAlertController(title: nil, message: "\n\n\n\n\n\n\n\n\n", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        alertController.view.addSubview(viewDatePicker)
        let cancelAction = UIAlertAction(title: "Avbryt", style: .cancel){ (action) in }
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "Klar", style: .default){ (action) in
            self.dateSelected()
        }
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true){}
        alertController.view.tintColor = UIColor.darkGray
    }
    
    func dateSelected(){
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let newDate = dateFormatter.string(from: self.datePicker.date)
        self.dateLabel.text = newDate
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


extension SearchViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(textField.tag == 1){
            fromTextField.resignFirstResponder()
            toTextField.becomeFirstResponder()
        } else {
            toTextField.resignFirstResponder()
        }
        return true
    }
}
