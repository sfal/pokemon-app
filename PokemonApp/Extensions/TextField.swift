//
//  TextField.swift
//  PokemonApp
//
//  Created by Serena Falchieri on 28/10/2019.
//  Copyright © 2019 Serena Falchieri. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    func formatTextField() {
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = self.layer.frame.size.height / 2
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.black.cgColor
        
    }
    
    func setLeftPadding(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setRightPadding(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    var isEmpty: Bool {
        if let text = self.text, !text.isEmpty {
             return false
        }
        return true
    }
  
}
