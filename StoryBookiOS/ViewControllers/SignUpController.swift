//
//  SignUpController.swift
//  StoryBookiOS
//
//  Created by Sanviraj Zahin Haque on 3/12/19.
//  Copyright © 2019 Sanviraj Zahin Haque. All rights reserved.
//

import UIKit

class SignUpController: UIViewController {

    @IBOutlet weak var FirstNameField: UITextField!
    
    @IBOutlet weak var LastNameField: UITextField!
    
    @IBOutlet weak var EmailAddressField: UITextField!
    
    @IBOutlet weak var PasswordField: UITextField!
    @IBOutlet weak var ConfirmPassword: UITextField!
    
    @IBOutlet weak var ErrorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        // Do any additional setup after loading the view.
    }
    func setUpViews(){
        ErrorLabel.alpha=0
    }

    func ValidateFields()-> String?{
        
        if( FirstNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines)=="" || LastNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines)==""  ||
            EmailAddressField.text?.trimmingCharacters(in: .whitespacesAndNewlines)=="" ||
            PasswordField.text?.trimmingCharacters(in: .whitespacesAndNewlines)=="" ||
            ConfirmPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines)==""){
            return "fill in the fields properly"
        }
        
        return nil
        
    }
    @IBAction func SignUpTapped(_ sender: Any) {
        let error = ValidateFields()
        if error != nil {
            ErrorLabel.text=error
            ErrorLabel.alpha=90
        }
    }
    
}
