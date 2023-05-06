//
//  RootClass.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on February 01, 2023
//
import Foundation
import SwiftyJSON

struct GeneralResponse: Codable {

    let status: String?
    let code: Int?
    let message: String?
    
    init(_ json: JSON) {
        status = json["status"].stringValue
        code = json["code"].intValue
        message = json["message"].stringValue
    }

}
