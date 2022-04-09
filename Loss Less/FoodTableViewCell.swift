//
//  FoodTableViewCell.swift
//  Loss Less
//
//  Created by Stefanus Hermawan Sebastian on 09/04/22.
//

import UIKit

class FoodTableViewCell: UITableViewCell {
    
    @IBOutlet var foodNameLabel: UILabel!
    @IBOutlet var foodLocationLabel: UILabel!
    @IBOutlet var foodAddedDateLabel: UILabel!
    @IBOutlet var foodExpDateLabel: UILabel!
    @IBOutlet var foodImageView: UIImageView!
    @IBOutlet var conditionImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
