//
//  FoodDetailIconTextCell.swift
//  Loss Less
//
//  Created by Stefanus Hermawan Sebastian on 10/04/22.
//

import UIKit

class FoodDetailIconTextCell: UITableViewCell {
    
    @IBOutlet var conditionImageView: UIImageView!
    @IBOutlet var dateLabel: UILabel! {
        didSet {
            dateLabel.numberOfLines = 0
            
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
