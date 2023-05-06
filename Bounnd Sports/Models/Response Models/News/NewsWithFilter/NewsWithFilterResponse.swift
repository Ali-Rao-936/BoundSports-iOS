//
//  RootClass.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on March 21, 2023
//
import Foundation
import SwiftyJSON

struct NewsWithFilterResponse {

    let currentPage: Int?
    let data: [NewsFilterData]?
    let firstPageUrl: String?
    let from: Int?
    let lastPage: Int?
    let lastPageUrl: String?
    let nextPageUrl: String?
    let path: String?
    let perPage: Int?
    let prevPageUrl: Any?
    let to: Int?
    let total: Int?

    init(_ json: JSON) {
        currentPage = json["current_page"].intValue
        data = json["data"].arrayValue.map { NewsFilterData($0) }
        firstPageUrl = json["first_page_url"].stringValue
        from = json["from"].intValue
        lastPage = json["last_page"].intValue
        lastPageUrl = json["last_page_url"].stringValue
        nextPageUrl = json["next_page_url"].stringValue
        path = json["path"].stringValue
        perPage = json["per_page"].intValue
        prevPageUrl = json["prev_page_url"]
        to = json["to"].intValue
        total = json["total"].intValue
    }

}
