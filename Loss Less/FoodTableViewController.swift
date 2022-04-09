//
//  FoodTableViewController.swift
//  Loss Less
//
//  Created by Stefanus Hermawan Sebastian on 09/04/22.
//

import UIKit

class FoodTableViewController: UITableViewController {
    
    var foodNames = ["Ramen", "Tomat", "Mie Goreng", "Chicken Wing", "Daging Sapi", "Bawang Merah"]
    
    var foodImages = ["ramen", "tomato", "miGoreng", "chickenWing", "rawMeat", "bawangMerah"]
    
    var foodLocations = ["Fridge", "Fridge", "Fridge", "Fridge", "Freezer", "Pantry"]
    
    var addedDates = ["Added : 09/04/2022", "Added : 09/04/2022", "Added : 09/04/2022", "Added : 09/04/2022", "Added : 09/04/2022", "Added : 09/04/2022"]
    
    var expDates = ["Exp : 12/04/2022", "Exp : 16/04/2022", "Exp : 12/04/2022", "Exp : 13/04/2022", "Exp : 29/04/2022", "Exp : 21/04/2022"]
    
    var foodConditions = ["warning", "good", "bad", "warning", "good", "good"]
    
    var foodEaten = Array(repeating: false, count: 6)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return foodNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ListCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! FoodTableViewCell

        // Configure the cell...
        cell.foodNameLabel.text = foodNames[indexPath.row]
        cell.foodLocationLabel.text = foodLocations[indexPath.row]
        cell.foodAddedDateLabel.text = addedDates[indexPath.row]
        cell.foodExpDateLabel.text = expDates[indexPath.row]
        cell.foodImageView.image = UIImage(named: foodImages[indexPath.row])
        cell.conditionImageView.image = UIImage(named: foodConditions[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
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
            self.foodNames.remove(at: indexPath.row)
            self.foodLocations.remove(at: indexPath.row)
            self.expDates.remove(at: indexPath.row)
            self.addedDates.remove(at: indexPath.row)
            self.foodImages.remove(at: indexPath.row)
            self.foodConditions.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            //call completion handler to dismiss the action button
            completionHandler(true)
        }
        let shareAction = UIContextualAction(style: .normal, title: "Share") { action, sourceView, completionHandler in
            let defaultText = "Just checking your " + self.foodNames[indexPath.row]
            
            let activityController: UIActivityViewController
            
            if let imageToShare = UIImage(named: self.foodImages[indexPath.row]) {
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
                self.foodEaten[indexPath.row] = (self.foodEaten[indexPath.row]) ? false : true
                cell.accessoryType = (self.foodEaten[indexPath.row]) ? .checkmark : .none
                
                completionHandler(true)
            }
            
            // Customize the action button
            checkInAction.backgroundColor = UIColor(red: 39.0/255.0, green: 174.0/255.0, blue: 96.0/255.0, alpha: 1.0)
            checkInAction.image = self.foodEaten[indexPath.row] ? UIImage(named: "undo") : UIImage(named: "tick")
            
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
