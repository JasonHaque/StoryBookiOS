//
//  SignUpController.swift
//  StoryBookiOS
//
//  Created by Sanviraj Zahin Haque on 3/12/19.
//  Copyright © 2019 Sanviraj Zahin Haque. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

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
    func showerror(_ message:String){
        ErrorLabel.text=message
        ErrorLabel.alpha=1

    }
    @IBAction func SignUpTapped(_ sender: Any) {
        let error = ValidateFields()
        if error != nil {
            showerror(error!)
        }
        else{
            let firtName = FirstNameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = LastNameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = EmailAddressField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = PasswordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            setUpViews()
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                //handle error
                
                if err != nil{
                    self.showerror("Sorry could not create user")
                }
                else{
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["firstName":firtName,"LastName":lastName,"uid":result!.user.uid]) { (error) in
                        if error != nil {
                            self.showerror("User not generated")
                        }
                    }
                }
                
                self.transitionHome()
            }
        }
    }
    func transitionHome(){
       let homeView = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        view.window?.rootViewController = homeView
        view.window?.makeKeyAndVisible()
    }
    
}
