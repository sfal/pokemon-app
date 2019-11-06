//
//  Label.swift
//  PokemonApp
//
//  Created by Serena Falchieri on 06/11/2019.
//  Copyright © 2019 Serena Falchieri. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    func formatFirstTypeLabel() {
        self.layer.cornerRadius = self.layer.frame.size.height / 2
        self.layer.masksToBounds = true
        self.textColor = UIColor.init(named: "TextColorAlternative")
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.init(named: "TextColorAlternative")?.cgColor
    }
    
    func formatSecondTypeLabel() {
        self.layer.cornerRadius = self.layer.frame.size.height / 2
        self.layer.masksToBounds = true
        self.textColor = UIColor.init(named: "TextColorAlternative")
    }

}
