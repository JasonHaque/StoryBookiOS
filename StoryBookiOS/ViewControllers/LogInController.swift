//
//  LogInController.swift
//  StoryBookiOS
//
//  Created by Sanviraj Zahin Haque on 3/12/19.
//  Copyright © 2019 Sanviraj Zahin Haque. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase


class LogInController: UIViewController {

    @IBOutlet weak var EmailAddress: UITextField!
    
    @IBOutlet weak var Password: UITextField!
    
    @IBOutlet weak var LoginErrorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        // Do any additional setup after loading the view.
    }
    func setUpViews(){
        LoginErrorLabel.alpha=0
    }
    

    
    @IBAction func LoginTapped(_ sender: Any) {
        let error = validateFields()
        if error != nil{
            showError(error!)
        }
        else{
            setUpViews()
            let email = EmailAddress.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = Password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            Auth.auth().signIn(withEmail: email, password: password) { (result, err) in
                if err != nil {
                    self.showError("Could not log in with this user")
                    
                }
                else{
                    self.transitionHome()
                }
            }
            
        }
        
    }
    
    func showError(_ message:String){
        LoginErrorLabel.text=message
        LoginErrorLabel.alpha=1
    }
    
    func validateFields()-> String? {
        if EmailAddress.text?.trimmingCharacters(in: .whitespacesAndNewlines)=="" ||
            Password.text?.trimmingCharacters(in: .whitespacesAndNewlines)==""{
            return "Fill up the fields properly"
        }
        return nil
    }
    func transitionHome(){
        let homeView = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        view.window?.rootViewController = homeView
        view.window?.makeKeyAndVisible()
    }
}
