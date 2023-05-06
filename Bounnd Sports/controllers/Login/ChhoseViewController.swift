//
//  ChhoseViewController.swift
//  Bounnd Sports
//
//  Created by Qoo on 27/04/2023.
//

import UIKit

class ChhoseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setBackButton()
    }
    

    @IBAction func btnSignIn(_ sender: Any) {
        self.openVC(storyBoard: "LoginStoryboard", identifier: "SignInViewController")
    }
    
    @IBAction func btnSignUp(_ sender: Any) {
        self.openVC(storyBoard: "LoginStoryboard", identifier: "SignUpViewController")
    }
}
