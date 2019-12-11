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
        UserLabel.text = Auth.auth().currentUser?.email

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
