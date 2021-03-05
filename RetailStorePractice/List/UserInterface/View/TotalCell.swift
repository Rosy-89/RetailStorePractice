//
//  TotalCell.swift
//  RetailStorePractice
//
//  Created by Juan carlos De la parra on 04/03/21.
//

import Foundation
import UIKit

class TotalCell: UITableViewCell {
    
    static let Identifier = "TotalCell"
    
    @IBOutlet private var totalPriceLabel: UILabel!
    
    func configure(withPrice price: Int) {
        totalPriceLabel.text = "$ \(price)"
    }
    
}
