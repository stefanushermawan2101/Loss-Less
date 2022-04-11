//
//  FoodDetailTextViewCell.swift
//  Loss Less
//
//  Created by Stefanus Hermawan Sebastian on 10/04/22.
//

import UIKit

class FoodDetailTextViewCell: UITableViewCell {
    
    @IBOutlet var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.numberOfLines = 0
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
