//
//  Meal.swift
//  Recepies
//
//  Created by Максим Лихачев on 06.04.2020.
//  Copyright © 2020 Максим Лихачев. All rights reserved.
//

import Foundation
import UIKit

class Meal: NSObject, NSCoding  {

    var name: String
    var emoji: String
    var recepie: String

    init?(name: String, emoji: String, recepie: String) {

        if name.isEmpty { return nil }

        self.name = name
        self.emoji = emoji
        self.recepie = recepie
    }

    func encode(with coder: NSCoder) {
        coder .encode(self.name, forKey: "name")
        coder .encode(self.emoji, forKey: "emoji")
        coder .encode(self.recepie, forKey: "recepie")
        //[]
    }

    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as! String
        self.emoji = aDecoder.decodeObject(forKey: "emoji") as! String
        self.recepie = aDecoder.decodeObject(forKey: "recepie") as! String

    }

}
