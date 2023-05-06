//
//  UpdatePasswordViewController.swift
//  Bounnd Sports
//
//  Created by Qoo on 27/04/2023.
//

import UIKit

class UpdatePasswordViewController: UIViewController {
    
    var viewModel = EditProfileViewmodel()

   
    @IBOutlet var etConfirmPassword: PaddingTextField!
    @IBOutlet var etNewPassword: UITextField!
    @IBOutlet var etOldPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setBackButton()
        setupNavBar(name: "Update Password")
        viewModel.delegateR = self
    }
    
    @IBAction func btnUpdate(_ sender: Any) {
        
        if etOldPassword.text == ""{
            Utility.showErrorSnackView(message: "Please enter current password".localized)
            return
        }
        if etNewPassword.text == ""{
            Utility.showErrorSnackView(message: "Please enter new password".localized)
            return
        }
        
        if etNewPassword.text?.count ?? 0 < 8{
            Utility.showErrorSnackView(message: "Password should contain at least 8 characters".localized)
            return
        }
        
        if etConfirmPassword.text != etNewPassword.text{
            Utility.showErrorSnackView(message: "Password mismatch".localized)
            return
        }
        let param = ["pass":etOldPassword.text!,
                     "newPass":etNewPassword.text!]
        viewModel.resetPasswordAPICall(param: param)
        
    }
    
 

}

extension UpdatePasswordViewController : ResetPasswordViewModelDelegate {
    func didFinishUpdate() {
        self.openVC(storyBoard: "LoginStoryboard", identifier: "DoneViewController")
    }
    
    
}
