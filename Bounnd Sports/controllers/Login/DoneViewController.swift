//
//  DoneViewController.swift
//  Bounnd Sports
//
//  Created by Qoo on 27/04/2023.
//

import UIKit

class DoneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnBack(_ sender: Any) {
        Utility.gotoHome()
       // self.openVC(storyBoard: "LoginStoryboard", identifier: "HomeViewController")
    }
 

}
