//
//  FormViewController.swift
//  PokemonApp
//
//  Created by Serena Falchieri on 28/10/2019.
//  Copyright © 2019 Serena Falchieri. All rights reserved.
//

import UIKit

class FormViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var genderView: UIView!
    
    var genderChoice : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.formatTextField()
        surnameTextField.formatTextField()
        emailTextField.formatTextField()
        genderView.styleView()
        maleButton.styleButtons()
        femaleButton.styleButtons()
        
        nameTextField.setLeftPadding(20)
        nameTextField.setRightPadding(20)
        surnameTextField.setLeftPadding(20)
        surnameTextField.setRightPadding(20)
        emailTextField.setLeftPadding(20)
        emailTextField.setRightPadding(20)
        
        emailTextField.delegate = self
        maleButton.isSelected = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTextField {
            self.view.frame.origin.y = -270 // Move view 150 points upward
        }
    }
    
    
    
    @IBAction func malePressed(_ sender: Any) {
        maleButton.isSelected = true
        femaleButton.isSelected = false
        genderChoice = "Male"
    }
    
    @IBAction func femalePressed(_ sender: Any) {
        femaleButton.isSelected = true
        maleButton.isSelected = false
        genderChoice = "Female"
    }
    
    @IBAction func submitPressed(_ sender: Any) {
        let isEmailValid = validateEmail(enteredEmail: emailTextField.text ?? "")
        
        // COMMENTED FOR TESTING PURPOSES
        
//        if nameTextField.isEmpty || surnameTextField.isEmpty || emailTextField.isEmpty {
//            let alert = UIAlertController(title: "WARNING", message: "Please fill all the fields", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//            self.present(alert, animated: true)
//        } else {
//            if isEmailValid {
//                let userDefaultStore = UserDefaults.standard //userDefault object
//                userDefaultStore.set(nameTextField.text, forKey: "name") //store textView value in userDefault
//                userDefaultStore.set(surnameTextField.text, forKey: "surname")
//                userDefaultStore.set(emailTextField.text, forKey: "email")
//                userDefaultStore.set(genderChoice, forKey: "gender")
//                let storyboard = UIStoryboard(name: "Cards", bundle: nil)
//                let vc = storyboard.instantiateViewController(withIdentifier: "CardsViewController") as UIViewController
//                self.navigationController?.pushViewController(vc, animated: true)
//            } else {
//                let emailAlert = UIAlertController(title: "WARNING", message: "Please insert a valid email address", preferredStyle: .alert)
//                emailAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//                self.present(emailAlert, animated: true)
//            }
//        }
        
        // COMMENT THE FOLLOWING LINES WHEN TESTING IS DONE
        
        let userDefaultStore = UserDefaults.standard //userDefault object
        userDefaultStore.set(nameTextField.text, forKey: "name") //store textView value in userDefault
        userDefaultStore.set(surnameTextField.text, forKey: "surname")
        userDefaultStore.set(emailTextField.text, forKey: "email")
        userDefaultStore.set(genderChoice, forKey: "gender")
        let storyboard = UIStoryboard(name: "Cards", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CardsViewController") as UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //hide keyboard if empty screen is pressed
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    // move view to original position
    @objc func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0
    }
    
    func validateEmail(enteredEmail:String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
    }
    
}

extension Notification.Name {
    static let didReceiveData = Notification.Name("didReceiveData")
}

