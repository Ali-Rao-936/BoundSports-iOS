//
//  Predictions.swift
//  Proball Sports
//
//  Created by KHADER on 13/03/2023.
//

import Foundation
import SwiftyJSON

//
//  RootClass.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on March 14, 2023
//
import Foundation
import SwiftyJSON

struct Predictions {

    let status: Int?
    let message: String?
    let searchKeyword: [Any]?
    let data: [DataPre]?
    let analyst: [Analyst]?
    let banner: [PredictionsBanner]?
    let bgUrl: String?
    let bgFootballUrl: String?
    let bgBasketballUrl: String?
    let topTag: [TopTag]?
    let totalRecord: String?
    let recordPerPage: String?

    init(_ json: JSON) {
        status = json["status"].intValue
        message = json["message"].stringValue
        searchKeyword = json["search_keyword"].arrayValue.map { $0 }
        data = json["data"].arrayValue.map { DataPre($0) }
        analyst = json["analyst"].arrayValue.map { Analyst($0) }
        banner = json["banner"].arrayValue.map { PredictionsBanner($0) }
        bgUrl = json["bg_url"].stringValue
        bgFootballUrl = json["bg_football_url"].stringValue
        bgBasketballUrl = json["bg_basketball_url"].stringValue
        topTag = json["top_tag"].arrayValue.map { TopTag($0) }
        totalRecord = json["total_record"].stringValue
        recordPerPage = json["record_per_page"].stringValue
    }

}
