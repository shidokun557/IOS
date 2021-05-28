//
//  MealTableViewController.swift
//  FoodManagement2021
//
//  Created by CNTT on 5/8/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
    var mealList = [Meal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let meal = Meal(mealName: "Mon an", mealImage: UIImage(named: "Defaultimage"), mealRatingValue: 4){
            mealList += [meal]
        }
        //Add the edit menu button
        navigationItem.leftBarButtonItem = editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mealList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reurseCel = "MealTableViewCell"
        if let cell = tableView.dequeueReusableCell(withIdentifier: reurseCel, for: indexPath) as? MealTableViewCell {
            // GET data from datasourse
            let meal = mealList[indexPath.row]
            //Fill the cell information into the cell
            cell.mealName.text = meal.mealName
            cell.mealImg.image = meal.mealImage
            cell.mealRatingControl.ratingValue = meal.mealRatingValue
            return cell
        }
        else{
            fatalError("Can not create the cell")
        }
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    //Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            mealList.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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
    @IBAction func unWindFromMealTableView(sender:UIStoryboardSegue){
       // print("Called from unWind...")
        if let sourceController = sender.source as? MealDetailController{
            if let newMeal = sourceController.meal{
                //Calculate the position of the new meal in the table view
                let newIndexPath = IndexPath(row: mealList.count, section: 0)
                // Add the new meal into the meal list
                mealList += [newMeal]
                // Insert the new meal to the table view
                tableView.insertRows(at: [newIndexPath], with: .none)
            }
        }
    }
    
    /*

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
