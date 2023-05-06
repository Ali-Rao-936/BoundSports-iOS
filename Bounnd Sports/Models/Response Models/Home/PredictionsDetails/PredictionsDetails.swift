//
//  PredictionsDetails.swift
//  Proball Sports
//
//  Created by KHADER on 15/03/2023.
//
//
import Foundation


import Foundation
import SwiftyJSON

struct PredictionsDetails {

    let status: Int?
    let message: String?
    let data: [DataDetails]?

    init(_ json: JSON) {
        status = json["status"].intValue
        message = json["message"].stringValue
        data = json["data"].arrayValue.map { DataDetails($0) }
    }

}
