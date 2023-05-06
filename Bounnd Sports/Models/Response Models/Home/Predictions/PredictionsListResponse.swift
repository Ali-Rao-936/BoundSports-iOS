////
////  PredictionsListResponse.swift
////  Proball Sports
////
////  Created by KHADER on 14/03/2023.
////
//
//import Foundation
//import SwiftyJSON
//
//struct PredictionsListResponse {
//
//    let list: [Predictions]?
//
//    init(_ json: JSON) {
//        list = json["data"].arrayValue.map { Predictions($0) }
//    }
//
//}
