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
        
        let image = UIColor.init(named: "MainColor")?.image(CGSize(width: 128, height: 128))
        
        self.setTitleColor(UIColor.init(named: "AlternativeTextColor"), for: .selected)
        self.tintColor = .clear
        self.setBackgroundImage(image, for: .selected)

    }
}

extension UIColor {
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}
