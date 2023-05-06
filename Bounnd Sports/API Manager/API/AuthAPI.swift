//
//  AuthAPI.swift
//  LiveScore
//
//  Created by Qoo on 15/02/2023.
//

import Foundation
import SwiftyJSON

class AuthAPI:WebService{
    
    
    
    func registerUser(param:[String:Any],completion:@escaping (GeneralResponse?) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl(apiType: .OTHER) + EndPoints.register.rawValue
        post(url: url, params: param, completion: { json in
            let response = GeneralResponse(json!)
            completion(response)
        }, failed: failed)
        
        
    }
    
    func loginAPI(param:[String:Any],completion:@escaping (LoginResponse?) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl(apiType: .OTHER) + EndPoints.login.rawValue
        post(url: url, params: param, completion: { json in
            let response = LoginResponse(json!)
            completion(response)
        }, failed: failed)
        
        
    }
    
    
    func deleteAccount(completion:@escaping (GeneralResponse?) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl(apiType: .OTHER) + EndPoints.deleteAccount.rawValue
        post(url: url, params: [:], completion: { json in
            let response = GeneralResponse(json!)
            completion(response)
        }, failed: failed)
       
    }
    
    func resetPassword(param:[String:Any],completion:@escaping (GeneralResponse?) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl(apiType: .OTHER) + EndPoints.resetPassword.rawValue
        post(url: url, params: param, completion: { json in
            let response = GeneralResponse(json!)
            completion(response)
        }, failed: failed)
        
        
    }
    
    func updateProfile(image : UIImage? , param:Dictionary<String, Any>?,completion:@escaping (LoginResponse?) -> Void, failed: @escaping (String) -> Void){
        let url = BaseUrl.getBaseUrl(apiType: .OTHER) + EndPoints.updateProfile.rawValue
        var imagesArr = [UIImage]()
        if image != nil{
            imagesArr.append(image!)
        }
        uploadPost(url: url, params: param, images: imagesArr, imageKey: "profile_pic", completion: { json in
            let response = LoginResponse(json!)
            completion(response)
        }, failed: failed)
    }
    
    
    
}
