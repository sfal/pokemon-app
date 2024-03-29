//
//  View.swift
//  PokemonApp
//
//  Created by Serena Falchieri on 28/10/2019.
//  Copyright © 2019 Serena Falchieri. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func styleView() {
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = self.layer.frame.size.height / 2
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.init(named: "BorderColor")?.cgColor
    }
}
