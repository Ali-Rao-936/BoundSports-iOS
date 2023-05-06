//
//  LoginViewModel.swift
//  Bounnd Sports
//
//  Created by Qoo on 01/05/2023.
//

import Foundation


protocol LoginViewModelDelegate{
    func didFinishLogin()
}

protocol SignupViewModelDelegate{
    func didFinishSignup()
}

protocol SettingsViewModelDelegate{
    func didFinishDeleteAccount()
}

class LoginViewModel{
    
    var delegate:LoginViewModelDelegate?
    var delegateS:SignupViewModelDelegate?
    var delegateD:SettingsViewModelDelegate?
    
    
    
    func callLoginAPI(param:[String:Any]){
        Utility.showProgress()
        AuthAPI().loginAPI(param: param) { response in
            if let userData = response?.data?.userInfo{
                AppPreferences.setUserData(obj: userData)
            }
            AppPreferences.setUserToken(tokenString: response?.data?.userInfo?.token ?? "")
            self.delegate?.didFinishLogin()
           
        } failed: { msg in
            Utility.showErrorSnackView(message: msg)
        }

    }
    
    func saveUser(param:[String:Any]){
        print(param)
        Utility.showProgress()
        AuthAPI().registerUser(param: param) { response in
            
            Utility.showSuccessSnackViewWithCompletion(message: response?.message ?? "", iconName: "") {
                self.delegateS?.didFinishSignup()
            }
           
        } failed: { msg in
            Utility.showErrorSnackView(message: msg)
        }

    }
    
    func callDeleteAccount(){
        Utility.showProgress()
        AuthAPI().deleteAccount { response in
            Utility.showSuccessSnackViewWithCompletion(message: response?.message ?? "", iconName: "") {
                self.delegateD?.didFinishDeleteAccount()
            }
        } failed: { message in
            Utility.showErrorSnackView(message: message)
        }

    }
    
}
