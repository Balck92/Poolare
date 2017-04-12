//
//  JourneyCell2.swift
//  MAM032
//
//  Created by Therese Kustvall Larsson on 27/11/16.
//  Copyright © 2016 test. All rights reserved.
//

import Foundation

import UIKit

class JourneyCell2: UITableViewCell {
    
    
    @IBOutlet weak var fromToLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setData(fromto: String!, date: String!, price: String!){
        self.fromToLabel.text = fromto
        self.dateLabel.text = date
        self.priceLabel.text = price
    }
    
}
