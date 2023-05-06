//
//  Mapping.swift
//  Shake Ball Sports
//
//  Created by Qoo on 13/12/2022.
//

import Foundation
import SwiftyJSON

struct Mapping {

    var keyword: String?
    var redirectUrl: String?
    var openType: String?

    
    init(){
        keyword = ""
        redirectUrl = ""
        openType = ""
    }
    
    init(_ json: JSON) {
        keyword = json["keyword"].stringValue
        redirectUrl = json["redirect_url"].stringValue
        openType = json["open_type"].stringValue
    }
    
    func toDictionary() -> [String:Any]{
        var dict = [String:Any]()
        dict["keyword"] = keyword ?? ""
        dict["redirect_url"] = redirectUrl ?? ""
        dict["open_type"] = openType ?? ""
        return dict
    }

}

