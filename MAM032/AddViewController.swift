//
//  ViewController.swift
//  MAM032
//
//  Created by Michal Stypa on 2016-10-11.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


class AddViewController: UIViewController {
    
    @IBOutlet weak var fromView: UIView!
    @IBOutlet weak var toView: UIView!
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var priceView: UIView!
    @IBOutlet weak var numberOfPersonsView: UIView!
    @IBOutlet weak var animalView: UIView!
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var numberOfPersonsLabel: UILabel!
    @IBAction func minusButtonPressed(_ sender: AnyObject) {
        let number = Int(numberOfPersonsLabel.text!)
        if(number > 1){
            numberOfPersonsLabel.text = "\(number! - 1)"
        }
    }
    @IBAction func plusButtonPressed(_ sender: AnyObject) {
        let number = Int(numberOfPersonsLabel.text!)
        numberOfPersonsLabel.text = "\(number! + 1)"
    }
    @IBOutlet weak var switchOutlet: UISwitch!
    @IBOutlet weak var addButton: UIButton!
    @IBAction func addButtonPressed(_ sender: AnyObject) {
        addJourney()
    }
    @IBOutlet weak var priceTextField: UITextField!
    
    @IBOutlet weak var fromTextField: UITextField!
    
    @IBOutlet weak var toTextField: UITextField!
    
    
    fileprivate var datePicker: UIDatePicker!
    
    @IBOutlet weak var scrollView: UIScrollView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        priceTextField.delegate = self
        fromTextField.delegate = self
        toTextField.delegate = self
        fromTextField.tag = 1
        addFromToViewTapRecpognizer()
        addDateTimeViewTapRecpognizer()
        addPriceViewTapRecpognizer()
        
        setViewProperties()
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard)))
        NotificationCenter.default.addObserver(self, selector: #selector(AddViewController.keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(AddViewController.keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil)

        // Do any additional setup after loading the view.
    }
    
    func setViewProperties() {
        plusButton.layer.cornerRadius = 5
        plusButton.layer.masksToBounds = true
        minusButton.layer.cornerRadius = 5
        minusButton.layer.masksToBounds = true
        textView.layer.cornerRadius = 5
        textView.layer.masksToBounds = true
        addButton.layer.cornerRadius = 5
        addButton.layer.masksToBounds = true
    }
    
    func addJourney(){
        //Lägg till resa
        self.showAlert("Din resa har lagts till", message: "Du hittar din resa under Mina resor")
    }
    
    
    func keyboardWillShow(notification:NSNotification){
        //give room at the bottom of the scroll view, so it doesn't cover up anything the user needs to tap
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        self.scrollView.contentInset = contentInset
        self.view.layoutSubviews()
    }
    
    func keyboardWillHide(notification:NSNotification){
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        self.scrollView.contentInset = contentInset
    }
    
    func dismissKeyboard(){
        self.view.endEditing(true)
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//Tap recon for from and to-views
extension AddViewController {
    
    func addFromToViewTapRecpognizer(){
        fromView.isUserInteractionEnabled = true
        let aSelector : Selector = #selector(AddViewController.fromViewTapped)
        let tapGesture = UITapGestureRecognizer(target: self, action: aSelector)
        tapGesture.numberOfTapsRequired = 1
        fromView.addGestureRecognizer(tapGesture)
        
        toView.isUserInteractionEnabled = true
        let aSelector2 : Selector = #selector(AddViewController.toViewTapped)
        let tapGesture2 = UITapGestureRecognizer(target: self, action: aSelector2)
        tapGesture2.numberOfTapsRequired = 1
        toView.addGestureRecognizer(tapGesture2)
    }
    
    func fromViewTapped(){
        //Här händer det något när man trycker på from view
      
    }
    
    func toViewTapped(){
        //Här händer det något när man trycker på to view
       
    }
    
}

//Tap recon date and time-views
extension AddViewController {
    
    func addDateTimeViewTapRecpognizer(){
        dateView.isUserInteractionEnabled = true
        let aSelector : Selector = #selector(AddViewController.dateViewTapped)
        let tapGesture = UITapGestureRecognizer(target: self, action: aSelector)
        tapGesture.numberOfTapsRequired = 1
        dateView.addGestureRecognizer(tapGesture)
        
        timeView.isUserInteractionEnabled = true
        let aSelector2 : Selector = #selector(AddViewController.timeViewTapped)
        let tapGesture2 = UITapGestureRecognizer(target: self, action: aSelector2)
        tapGesture2.numberOfTapsRequired = 1
        timeView.addGestureRecognizer(tapGesture2)
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

    
    func timeViewTapped(){
        let viewTimePicker: UIView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 200))
        viewTimePicker.backgroundColor = UIColor.clear
        
        self.datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 200))
        self.datePicker.datePickerMode = UIDatePickerMode.time
        
        datePicker.locale = NSLocale(localeIdentifier: "sv") as Locale
        
        self.datePicker.date = Date()
        
        viewTimePicker.addSubview(self.datePicker)
        
        
        let alertController = UIAlertController(title: nil, message: "\n\n\n\n\n\n\n\n\n", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        alertController.view.addSubview(viewTimePicker)
        let cancelAction = UIAlertAction(title: "Avbryt", style: .cancel){ (action) in }
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "Klar", style: .default){ (action) in
            self.timeSelected()
        }
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true){}
        alertController.view.tintColor = UIColor.darkGray
        
    }
    func timeSelected(){
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let newTime = dateFormatter.string(from: self.datePicker.date)
        
        self.timeLabel.text = newTime
    }
    
}

//Tap recon for price view
extension AddViewController {
    
    func addPriceViewTapRecpognizer(){
        priceView.isUserInteractionEnabled = true
        let aSelector : Selector = #selector(AddViewController.priceViewTapped)
        let tapGesture = UITapGestureRecognizer(target: self, action: aSelector)
        tapGesture.numberOfTapsRequired = 1
        priceView.addGestureRecognizer(tapGesture)
    }
    
    func priceViewTapped(){
        priceTextField.becomeFirstResponder()
    }
    
}

//Price text field delegation
extension AddViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(textField.tag == 1){
            fromTextField.resignFirstResponder()
            toTextField.becomeFirstResponder()
        }
        textField.resignFirstResponder()
        return true
    }

}



