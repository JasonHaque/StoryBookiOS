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

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func SignUpTapped(_ sender: Any) {
    }
    
}
