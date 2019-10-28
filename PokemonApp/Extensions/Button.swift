//
//  Button.swift
//  PokemonApp
//
//  Created by Serena Falchieri on 28/10/2019.
//  Copyright © 2019 Serena Falchieri. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func styleButtons() {
        self.layer.cornerRadius = self.layer.frame.size.height / 2
        self.layer.masksToBounds = true
        
        if isSelected {
            self.layer.backgroundColor = UIColor.init(named: "MainColor")?.cgColor
        } else {
            self.layer.backgroundColor = UIColor.init(named: "BackgroundColor")?.cgColor
            self.setTitleColor(UIColor.init(named: "TextColor"), for: .normal)
        }
        
    }
}
