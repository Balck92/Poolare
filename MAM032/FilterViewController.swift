//
//  FilterViewController.swift
//  MAM032
//
//  Created by Calle Balck on 2016-11-29.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit


class FilterViewController: UIViewController {
    
    
    @IBOutlet var dismissButton: UIButton!
    
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var numberOfPersonsLabel: UILabel!
    
    @IBOutlet weak var genderSegment: UISegmentedControl!
    
    @IBOutlet weak var ageView: UIView!

    @IBOutlet weak var fromAgeTextField: UITextField!
    @IBOutlet weak var toAgeTextField: UITextField!
    
    @IBOutlet weak var animalSwitch: UISwitch!
    
    
    
    @IBAction func minusButtonPressed(_ sender: Any) {
        let number = Int(numberOfPersonsLabel.text!)
        if(number! > 1){
            numberOfPersonsLabel.text = "\(number! - 1)"
        }
    }
    
    @IBAction func plusButtonPressed(_ sender: Any) {
        let number = Int(numberOfPersonsLabel.text!)
        numberOfPersonsLabel.text = "\(number! + 1)"
        
    }
   
    fileprivate var datePicker: UIDatePicker!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTimeViewTapRecpognizer()
        fromAgeTextField.delegate = self
        toAgeTextField.delegate = self
        fromAgeTextField.tag = 1
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard)))
        
            }
    
   
    @IBAction func dismissAction(_ sender: Any) {
        saveSearchValues()
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func saveSearchValues(){
//        SearchManager.instance.time = datePicker.date.timeIntervalSince1970
        if(genderSegment.selectedSegmentIndex == 0){
            SearchManager.instance.gender = .woman
        } else if(genderSegment.selectedSegmentIndex == 1) {
            SearchManager.instance.gender = .man
        } else {
            SearchManager.instance.gender = .none
        }
        
        SearchManager.instance.minAge = 18
        SearchManager.instance.maxAge = 99
        
        SearchManager.instance.animalAllowed = animalSwitch.isOn
        
        SearchManager.instance.didChange = true
        
    
    
    }
    
    func dismissKeyboard(){
        self.view.endEditing(true)
    }

    
}


extension FilterViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(textField.tag == 1){
            fromAgeTextField.resignFirstResponder()
            toAgeTextField.becomeFirstResponder()
        } else {
            toAgeTextField.resignFirstResponder()
        }
        return true
    }
}

//Tap recon time-view
extension FilterViewController {
    
    func addTimeViewTapRecpognizer(){
        timeView.isUserInteractionEnabled = true
        let aSelector : Selector = #selector(FilterViewController.timeViewTapped)
        let tapGesture = UITapGestureRecognizer(target: self, action: aSelector)
        tapGesture.numberOfTapsRequired = 1
        timeView.addGestureRecognizer(tapGesture)
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





