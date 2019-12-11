//
//  HomeViewController.swift
//  StoryBookiOS
//
//  Created by Sanviraj Zahin Haque on 8/12/19.
//  Copyright © 2019 Sanviraj Zahin Haque. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    @IBOutlet weak var UserLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()

    }
    
    func setupViews(){
        UserLabel.text = Auth.auth().currentUser?.email
        
    }
    

    

}
