//
//  FoodTableViewController.swift
//  Loss Less
//
//  Created by Stefanus Hermawan Sebastian on 09/04/22.
//

import UIKit
import Foundation

class FoodTableViewController: UITableViewController {
    
//    var foodNames = ["Ramen", "Tomat", "Mie Goreng", "Chicken Wing", "Daging Sapi", "Bawang Merah"]
//
//    var foodImages = ["ramen", "tomato", "miGoreng", "chickenWing", "rawMeat", "bawangMerah"]
//
//    var foodLocations = ["Fridge", "Fridge", "Fridge", "Fridge", "Freezer", "Pantry"]
//
//    var addedDates = ["Added : 09/04/2022", "Added : 09/04/2022", "Added : 09/04/2022", "Added : 09/04/2022", "Added : 09/04/2022", "Added : 09/04/2022"]
//
//    var expDates = ["Exp : 12/04/2022", "Exp : 16/04/2022", "Exp : 12/04/2022", "Exp : 13/04/2022", "Exp : 29/04/2022", "Exp : 21/04/2022"]
//
//    var foodConditions = ["warning", "good", "bad", "warning", "good", "good"]
//
//    var foodEaten = Array(repeating: false, count: 6)
    
    var foods: [Food] = [
        Food(name: "Ramen", location: "Fridge", addedDate: "Added : 09/04/2022", expDate: "Exp : 12/04/2022", image: "ramen", condition: "warning", isEaten: false, description: "Ramen beli di Marugame"),
        Food(name: "Tomat", location: "Fridge", addedDate: "Added : 09/04/2022", expDate: "Exp : 16/04/2022", image: "tomato", condition: "good", isEaten: false, description: "Tomat beli di Hero"),
        Food(name: "Mie Goreng", location: "Fridge", addedDate: "Added : 09/04/2022", expDate: "Exp : 12/04/2022", image: "miGoreng", condition: "bad", isEaten: false, description: "Indomie bikinan semalem"),
        Food(name: "Chicken Wing", location: "Fridge", addedDate: "Added : 09/04/2022", expDate: "Exp : 12/04/2022", image: "chickenWing", condition: "warning", isEaten: false, description: "Chicken wing dibeliin CALON BINI"),
        Food(name: "Daging Sapi", location: "Freezer", addedDate: "Added : 09/04/2022", expDate: "Exp : 12/04/2022", image: "rawMeat", condition: "good", isEaten: false, description: "Daging sapi asli dari sapinya"),
        Food(name: "Bawang Merah", location: "Pantry", addedDate: "Added : 09/04/2022", expDate: "Exp : 12/04/2022", image: "bawangMerah", condition: "good", isEaten: false, description: "Kakaknya bawang putih yang baik hati")
    ]
    
    // MARK:M- View Controller Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //customize NavBar
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.hidesBarsOnSwipe = true
        
        navigationController?.hidesBarsOnSwipe = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return foods.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ListCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! FoodTableViewCell

        // Configure the cell...
        cell.foodNameLabel.text = foods[indexPath.row].name
        cell.foodLocationLabel.text = foods[indexPath.row].location
        cell.foodAddedDateLabel.text = foods[indexPath.row].addedDate
        cell.foodExpDateLabel.text = foods[indexPath.row].expDate
        cell.foodImageView.image = UIImage(named: foods[indexPath.row].image)
        cell.conditionImageView.image = UIImage(named: foods[indexPath.row].condition)
        
        cell.accessoryType = foods[indexPath.row].isEaten ? .checkmark : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    // MARK:- UITableViewDelegate Protocol
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete{
//            //Delete the row from the data source
//            foodNames.remove(at: indexPath.row)
//            foodLocations.remove(at: indexPath.row)
//            expDates.remove(at: indexPath.row)
//            addedDates.remove(at: indexPath.row)
//            foodImages.remove(at: indexPath.row)
//            foodConditions.remove(at: indexPath.row)
//        }
//
//        tableView.deleteRows(at: [indexPath], with: .fade)
//
//    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { action, sourceView, completionHandler in
            //delete the row from data source
//            self.foodNames.remove(at: indexPath.row)
//            self.foodLocations.remove(at: indexPath.row)
//            self.expDates.remove(at: indexPath.row)
//            self.addedDates.remove(at: indexPath.row)
//            self.foodImages.remove(at: indexPath.row)
//            self.foodConditions.remove(at: indexPath.row)
            
            self.foods.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            //call completion handler to dismiss the action button
            completionHandler(true)
        }
        let shareAction = UIContextualAction(style: .normal, title: "Share") { action, sourceView, completionHandler in
            let defaultText = "Just checking your " + self.foods[indexPath.row].name
            
            let activityController: UIActivityViewController
            
            if let imageToShare = UIImage(named: self.foods[indexPath.row].image) {
//                activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
                activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            }else{
                activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            }
            
            
            
//            let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            
            self.present(activityController, animated: true, completion: nil)
            completionHandler(true)
        }
        
        deleteAction.backgroundColor = UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 68.0/255.0, alpha: 1.0)
        deleteAction.image = UIImage(named: "delete")
        
        shareAction.backgroundColor = UIColor(red: 254.0/255.0, green: 149.0/255.0, blue: 38.0/255.0, alpha: 1.0)
        shareAction.image = UIImage(named: "share")
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
        
        return swipeConfiguration
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let checkInAction = UIContextualAction(style: .normal, title: "Check-in") { (action, sourceView, completionHandler) in
                let cell = tableView.cellForRow(at: indexPath) as! FoodTableViewCell
                self.foods[indexPath.row].isEaten = (self.foods[indexPath.row].isEaten) ? false : true
                cell.accessoryType = (self.foods[indexPath.row].isEaten) ? .checkmark : .none
                
                completionHandler(true)
            }
            
            // Customize the action button
            checkInAction.backgroundColor = UIColor(red: 30, green: 174, blue: 96)
            checkInAction.image = self.foods[indexPath.row].isEaten ? UIImage(named: "undo") : UIImage(named: "tick")
            
            let swipeConfiguration = UISwipeActionsConfiguration(actions: [checkInAction])
            
            return swipeConfiguration
        }
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFoodDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! FoodDetailViewController
                destinationController.food = foods[indexPath.row]
            }
        }
    }
    

}
