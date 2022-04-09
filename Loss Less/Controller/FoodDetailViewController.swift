//
//  FoodDetailViewController.swift
//  Loss Less
//
//  Created by Stefanus Hermawan Sebastian on 09/04/22.
//

import UIKit

class FoodDetailViewController: UIViewController {
    
    @IBOutlet var foodImageView: UIImageView!
    
    var food: Food = Food()

    override func viewDidLoad() {
        super.viewDidLoad()

        foodImageView.image = UIImage(named: food.image)
        navigationItem.largeTitleDisplayMode = .never
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
