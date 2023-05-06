//
//  SignUpViewController.swift
//  Bounnd Sports
//
//  Created by Qoo on 27/04/2023.
//

import UIKit

class SignUpViewController: UIViewController {

    
    var viewModel = LoginViewModel()
    
    @IBOutlet var etName: PaddingTextField!
    @IBOutlet var SignInLable: UILabel!
    @IBOutlet var etConfirmPassword: UITextField!
    @IBOutlet var etPassword: UITextField!
    @IBOutlet var etEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setBackButton()
        viewModel.delegateS = self
        // Do any additional setup after loading the view.
        SignInLable.setOnClickListener {
            self.openVC(storyBoard: "LoginStoryboard", identifier: "SignInViewController")
        }
    }
    

    @IBAction func btnSignUp(_ sender: Any) {
        validateInputs()
    }
 

    func validateInputs(){
        
        if etName.text == ""{
            Utility.showErrorSnackView(message: "Please enter name".localized)
            return
        }
        
        if !(etEmail.text?.isEmailID() ?? false){
            Utility.showErrorSnackView(message: "Please enter valid email ID".localized)
            return
            
        }
        
        if etPassword.text == ""{
            Utility.showErrorSnackView(message: "Please enter password".localized)
            return
        }
        
        if etPassword.text != etConfirmPassword.text{
            Utility.showErrorSnackView(message: "Password mismatch".localized)
            return
        }
        
        if etConfirmPassword.text?.count ?? 0 < 8{
            Utility.showErrorSnackView(message: "Password should contain at least 8 characters".localized)
            return
        }
        
        let param:[String:Any] = ["username":etEmail.text!,
                                  "name":etName.text!,
                                  "dob" : "",
                                  "pass":etConfirmPassword.text!]
        viewModel.saveUser(param: param)
    }

}

extension SignUpViewController : SignupViewModelDelegate {
    func didFinishSignup() {
        Utility.gotoHome()
    }
    
}
