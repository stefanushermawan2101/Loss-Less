//
//  FoodDetailViewController.swift
//  Loss Less
//
//  Created by Stefanus Hermawan Sebastian on 09/04/22.
//

import UIKit

class FoodDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var headerView: FoodDetailHeaderView!
    
    var food: Food = Food()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
        //Configure the header view
        headerView.nameLabel.text = food.name
        headerView.locationLabel.text = food.location
        headerView.headerImageView.image = UIImage(named: food.image)
        
        //Configure the table view
        tableView.delegate = self
        tableView.dataSource = self
        
        //Customize arrow navBar
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.hidesBarsOnSwipe = false
        
        tableView.contentInsetAdjustmentBehavior = .never
        
        navigationController?.hidesBarsOnSwipe = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FoodDetailIconTextCell.self), for: indexPath) as! FoodDetailIconTextCell
            cell.conditionImageView.image = UIImage(named: "calendar")
            cell.dateLabel.text = food.addedDate
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FoodDetailIconTextCell.self), for: indexPath) as! FoodDetailIconTextCell
            cell.conditionImageView.image = UIImage(named: food.condition)
            cell.dateLabel.text = food.expDate
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FoodDetailTextViewCell.self), for: indexPath) as! FoodDetailTextViewCell
            cell.descriptionLabel.text = food.description
            return cell
        default:
            fatalError("Failed to instantiate the table view cell for detail view controller!!!!!!")
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
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
