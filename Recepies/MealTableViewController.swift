//
//  MealTableViewController.swift
//  Recepies
//
//  Created by Максим Лихачев on 06.04.2020.
//  Copyright © 2020 Максим Лихачев. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {

    var meals = [Meal]()

    override func viewDidLoad() {
        super.viewDidLoad()
        initDefaults()
        loadMeals()
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        //#warning ("Incomplete implementation, return the number of sections")
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals.count
    }

    private func initDefaults() {

        guard let meal1 = Meal(name: "Cookie", emoji: "🍪", recepie: "Cookie recepie") else {
            fatalError("Unable to instantiate meal1")
        }

        guard let meal2 = Meal(name: "Donut", emoji: "🍩", recepie: "Donut recepie") else {
            fatalError("Unable to instantiate meal2")
        }

        guard let meal3 = Meal(name: "Chocolate", emoji: "🍫", recepie: "Chocolate recepie") else {
            fatalError("Unable to instantiate meal2")
        }

        let arr: [Meal] = [meal1, meal2, meal3]

        UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: arr as [Meal]), forKey: "meal")
        UserDefaults.standard.synchronize()
    }

    private func loadMeals() {
        /*
        let emoji1 = "🍪"
        let emoji2 = "🍩"
        let emoji3 = "🍫"

        guard let meal1 = Meal(name: "Cookie", emoji: emoji1, recepie: "Cookie recepie") else {
            fatalError("Unable to instantiate meal1")
        }

        guard let meal2 = Meal(name: "Donut", emoji: emoji2, recepie: "Donut recepie") else {
            fatalError("Unable to instantiate meal2")
        }

        guard let meal3 = Meal(name: "Chocolate", emoji: emoji3, recepie: "Chocolate recepie") else {
            fatalError("Unable to instantiate meal2")
        }

        meals += [meal1, meal2, meal3]

        */

        let newData: NSData = UserDefaults.standard.object(forKey: "meal") as! NSData
        let newArr: Array = NSKeyedUnarchiver.unarchiveObject(with: newData as Data) as! [Meal]
        meals += newArr
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "MealTableViewCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MealTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }

        // Fetches the appropriate meal for the data source layout.
        let meal = meals[indexPath.row]

        cell.nameLabel.text = meal.name
        cell.emojiLabel.text = meal.emoji

        return cell
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
        super.prepare(for: segue, sender: sender)
        switch(segue.identifier ?? "") {
            case "ShowDetail":
            guard let mealDetailViewController = segue.destination as? MealViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }

            guard let selectedMealCell = sender as? MealTableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }

            guard let indexPath = tableView.indexPath(for: selectedMealCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }

            let selectedMeal = meals[indexPath.row]
            mealDetailViewController.meal = selectedMeal

        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }


}
