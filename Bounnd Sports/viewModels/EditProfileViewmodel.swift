//
//  EditProfileViewmodel.swift
//  Bounnd Sports
//
//  Created by Qoo on 01/05/2023.
//

import Foundation
import UIKit



protocol EditProfileViewmodelDelegates{
    func uploadComplete()
}

protocol ResetPasswordViewModelDelegate{
    func didFinishUpdate()
}

class EditProfileViewmodel{
    var delegate:EditProfileViewmodelDelegates?
    var delegateR:ResetPasswordViewModelDelegate?
    
    func resetPasswordAPICall(param:[String:Any]){
        Utility.showProgress()
        AuthAPI().resetPassword(param: param) { response in
            Utility.showSuccessSnackViewWithCompletion(message: response?.message ?? "", iconName: "") {
                self.self.delegateR?.didFinishUpdate()
            }
        } failed: { msg in
            Utility.showErrorSnackView(message: msg)
        }
        
    }
    
    
    func updateProfile(image:UIImage?,name:String){
        var param:Dictionary<String,Any>=Dictionary()
        param["name_update"]=name
        Utility.showProgress()
        AuthAPI().updateProfile(image: image, param: param, completion: {response in
            AppPreferences.setUserToken(tokenString: response?.data?.userInfo?.token ?? "")
            if let userData = response?.data?.userInfo{
                AppPreferences.setUserData(obj: userData)
            }
            Utility.showSuccessSnackViewWithCompletion(message: response?.message ?? "", iconName: "") {
                self.delegate?.uploadComplete()
                
            }
            
        }, failed: {error in
            Utility.showErrorSnackView(message: error.string)
        })
    }
}

