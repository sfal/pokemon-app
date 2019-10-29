//
//  CardsViewController.swift
//  PokemonApp
//
//  Created by Serena Falchieri on 28/10/2019.
//  Copyright © 2019 Serena Falchieri. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userDefault = UserDefaults.standard //create UserDefault object
        
        nameLabel.text = userDefault.string(forKey: "name")
        surnameLabel.text = userDefault.string(forKey: "surname")
        emailLabel.text = userDefault.string(forKey: "email")
        genderLabel.text = userDefault.string(forKey: "gender")

        
    }
    

   

}
