//
//  Meal.swift
//  Recepies
//
//  Created by Максим Лихачев on 06.04.2020.
//  Copyright © 2020 Максим Лихачев. All rights reserved.
//

import Foundation
import UIKit

class Meal {
    var name: String
    var emoji: String

    init?(name: String, emoji: String?) {

        if name.isEmpty { return nil }

        self.name = name
        self.emoji = emoji ?? ""
    }
}
