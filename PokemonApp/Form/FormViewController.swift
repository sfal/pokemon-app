//
//  FormViewController.swift
//  PokemonApp
//
//  Created by Serena Falchieri on 28/10/2019.
//  Copyright © 2019 Serena Falchieri. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var genderView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        maleButton.isSelected = true
        nameTextField.formatTextField()
        surnameTextField.formatTextField()
        emailTextField.formatTextField()
        genderView.styleView()
        maleButton.styleButtons()
        femaleButton.styleButtons()
        
        
    }
    

    

}
