//
//  RootClass.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on March 27, 2023
//
import Foundation
import SwiftyJSON

struct Categories {

    let status: Int?
    let message: String?
    let data: [DataCategory]?

    init(_ json: JSON) {
        status = json["status"].intValue
        message = json["message"].stringValue
        data = json["data"].arrayValue.map { DataCategory($0) }
    }

}
