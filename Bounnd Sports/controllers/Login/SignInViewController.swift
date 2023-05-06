//
//  SignInViewController.swift
//  Bounnd Sports
//
//  Created by Qoo on 27/04/2023.
//

import UIKit

class SignInViewController: UIViewController {

    var viewModel = LoginViewModel()
    @IBOutlet var SignUpLable: UILabel!
    @IBOutlet var etPassword: UITextField!
    @IBOutlet var etEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()

        // Do any additional setup after loading the view.
        SignUpLable.setOnClickListener {
            self.openVC(storyBoard: "LoginStoryboard", identifier: "SignUpViewController")
        }
    }
    

    @IBAction func btnSignIn(_ sender: Any) {
        
        validate()
}

func initialSetup(){
  //  etPassword.isSecureTextEntry = true
    setBackButton()
    viewModel.delegate = self
}

func validate(){
    if etEmail.text == ""{
        Utility.showErrorSnackView(message: "Enter your email".localized)
        return
    }
    
    if etPassword.text == ""{
        Utility.showErrorSnackView(message: "Enter you Password".localized)
        return
        
    }
    let param = ["username":etEmail.text!,
                 "pass":etPassword.text!]
    
    viewModel.callLoginAPI(param: param)
    
}

}


extension SignInViewController:LoginViewModelDelegate{
func didFinishLogin() {
    Utility.gotoHome()
    print("Logined")
    
}


}

