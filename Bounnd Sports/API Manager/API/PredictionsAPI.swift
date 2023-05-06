//
//  PredictionsAPI.swift
//  Proball Sports
//
//  Created by KHADER on 14/03/2023.
//

import Foundation


class PredictionsAPI:WebService{
    
    func getPredictionsRes(page:Int,completion:@escaping (Predictions) -> Void, failed: @escaping (String) -> Void){
      //  let url = "https://tj.77577.com/v2/analysis/get_analysis.php"
        let url = "https://ios.app99877.com/v2/analysis/get_analysis.tj"
        print("TAG url \(url)" )
        var lag = ""
        if Utility.getCurrentLang() == "cn"
        {
            lag = "zh"
        }else{
            lag = Utility.getCurrentLang()
        }
        print("TAG lang \(lag)" )
        
        let params: [String: Any] = ["sport_type": 0, "lang": lag,
                "offset": 0]
        

        specalPost(url: url, params: params, completion: { json in

            let response = Predictions(json!)

            completion(response)
        }, failed: failed)
    }
    
    
    func getPredictionsDetailsRes(match_id:Int,user_id:Int,ref_id:Int,completion:@escaping (PredictionsDetails) -> Void, failed: @escaping (String) -> Void){
        
       // let url = "https://tj.77577.com/v2/analysis/get_analysis_detail.php"
        let url = "https://ios.app99877.com/v2/analysis/get_analysis_detail.tj"
        print("TAG url \(url)" )
        var lag = ""
        if Utility.getCurrentLang() == "cn"
        {
            lag = "zh"
        }else{
            lag = Utility.getCurrentLang()
        }
        print("TAG lang \(lag)" )
        //sport_type , ref_id ,lang
        
        let params: [String: Any] = ["lang": lag ,"ref_id": ref_id
                                     ,"sport_type": 0,"offset": 0,"match_id": match_id, "user_id":user_id]
        
        print("TAG params \(params)" )

        specalPost(url: url, params: params, completion: { json in

            let response = PredictionsDetails(json!)

            completion(response)
        }, failed: failed)
    }
    
    
    
//    func getExpertsRes(completion:@escaping (Experts) -> Void, failed: @escaping (String) -> Void){
//       // let url = "https://tj.77577.com/v2/analysis/get_analysis.php"
//        let url = "https://ios.app99877.com/v2/analysis/get_analysis.tj"
//        print("TAG url \(url)" )
//        var lag = ""
//        if Utility.getCurrentLang() == "cn"
//        {
//            lag = "zh"
//        }else{
//            lag = Utility.getCurrentLang()
//        }
//        print("TAG lang \(lag)" )
//
//
//        let params: [String: Any] = ["sport_type": 0, "lang": lag,
//                "offset": 0]
//
//
//        specalPost(url: url, params: params, completion: { json in
//
//            let response = Experts(json!)
//
//            completion(response)
//        }, failed: failed)
//    }
    
    
//    func getExpertsDetailsRes(user_id:Int,completion:@escaping (ExpertsDetails) -> Void, failed: @escaping (String) -> Void){
//        //let url = "https://tj.77577.com/v2/analyst/get_analyst_detail.php"
//        let url = "https://ios.app99877.com/v2/analyst/get_analyst_detail.tj"
//        print("TAG url \(url)" )
//
//        var lag = ""
//        if Utility.getCurrentLang() == "cn"
//        {
//            lag = "zh"
//        }else{
//            lag = Utility.getCurrentLang()
//        }
//        print("TAG lang \(lag)" )
//
//        let params: [String: Any] = ["lang": lag ,"sport_type": 0,"id": user_id,
//                "offset": 0]
//
//        print("TAG params \(params)" )
//
//        specalPost(url: url, params: params, completion: { json in
//
//            let response = ExpertsDetails(json!)
//
//            completion(response)
//        }, failed: failed)
//    }
    
}
