//
//  CategoriesAPI.swift
//  Ball pie Sports
//
//  Created by KHADER on 27/03/2023.
//

import Foundation


class CategoriesAPI : WebService {
    
    func getCategories(cat_type:String,pageIndex:Int,search:String="",completion:@escaping (Categories) -> Void, failed: @escaping (String) -> Void){

        let url = "https://app.8com.cloud/api/v1/sportscore/data/match.php"

        
        var params = [String : String]()
        let date = Date()
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        let dateString = df.string(from: date)
        //print("TAG \(dateString)")
        params = ["lang":Utility.getCurrentLang(), "date":dateString,"sport":cat_type ,"timezone":"+08:00"]
        
        print("TAG \(params)")
        post(url: url, params: params, completion: { json in
            let response = Categories(json!)
            completion(response)
        }, failed: failed)
    }
    
    
}
