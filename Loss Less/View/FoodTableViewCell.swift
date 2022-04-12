//
//  FoodTableViewCell.swift
//  Loss Less
//
//  Created by Stefanus Hermawan Sebastian on 09/04/22.
//

import UIKit

class FoodTableViewCell: UITableViewCell {
    
    static let identifier = "ListFoodTableViewCell"
    
    @IBOutlet var foodNameLabel: UILabel!
    @IBOutlet var foodLocationLabel: UILabel!
    @IBOutlet var foodAddedDateLabel: UILabel!
    @IBOutlet var foodExpDateLabel: UILabel!
    @IBOutlet var foodImageView: UIImageView!{
        didSet {
            foodImageView.layer.cornerRadius = 10.0
            foodImageView.clipsToBounds = true
        }
    }
    @IBOutlet var conditionImageView: UIImageView!
    
    func setup(food: Food) {
        foodNameLabel.text = food.title
        foodLocationLabel.text = food.location
        foodExpDateLabel.text = food.expDate
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
