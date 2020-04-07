//
//  ViewController.swift
//  Recepies
//
//  Created by Максим Лихачев on 05.04.2020.
//  Copyright © 2020 Максим Лихачев. All rights reserved.
//


//Необходимо создать динамическую таблицу(список рецептов), загрузить в неё данные из NSUserDefaults, по выбору строки таблицы, необходимо, чтобы открывался экран с более подробной информацией(конкретный рецепт). TableView для создания таблицы.

import UIKit

class MealViewController: UIViewController {

    @IBOutlet weak var mealName: UILabel!
    @IBOutlet weak var mealEmoji: UILabel!
    @IBOutlet weak var mealRecepie: UITextView!

    var meal: Meal?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mealRecepie.delegate = self as? UITextViewDelegate

        if let meal = meal {
            navigationItem.title = meal.name
            mealName.text = meal.name
            mealEmoji.text = meal.emoji
            mealRecepie.text = meal.recepie
        }
    }


}

