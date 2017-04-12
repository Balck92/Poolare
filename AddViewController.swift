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
    
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
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
    
    
    fileprivate var datePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        priceTextField.delegate = self
        addFromToViewTapRecpognizer()
        addDateTimeViewTapRecpognizer()
        addPriceViewTapRecpognizer()
        
        setViewProperties()

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
        self.showAlert("Grattis", message: "Du har klickat på lägg till resa")
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
        self.showAlert("FromView", message: "Du har tryckt på fromView")
    }
    
    func toViewTapped(){
        //Här händer det något när man trycker på to view
        self.showAlert("ToView", message: "Du har tryckt på toView")
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
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "yyyy-MM-dd"
        self.datePicker.date = Date()
        
        viewDatePicker.addSubview(self.datePicker)
        
        let alertController = UIAlertController(title: nil, message: "\n\n\n\n\n\n\n\n\n", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        alertController.view.addSubview(viewDatePicker)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel){ (action) in }
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "Done", style: .default){ (action) in
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
        //Här händer det något när man trycker på time view
        self.showAlert("TimeView", message: "Du har tryckt på timeView")
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
        priceLabel.alpha = 0
        priceTextField.alpha = 1
        priceTextField.text = priceLabel.text
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
        textField.resignFirstResponder()
        priceTextField.alpha = 0
        priceLabel.text = priceTextField.text
        priceLabel.alpha = 1
        return true
    }

}
