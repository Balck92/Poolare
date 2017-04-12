//
//  JourneyCell.swift
//  MAM032
//
//  Created by Michal Stypa on 2016-11-07.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit

class JourneyCell: UITableViewCell {
    
    
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
