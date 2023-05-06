//
//  TopTag.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on March 14, 2023
//
import Foundation
import SwiftyJSON

struct TopTag {

    let title: String?
    let imageUrl: String?
    let url: String?

    init(_ json: JSON) {
        title = json["title"].stringValue
        imageUrl = json["image_url"].stringValue
        url = json["url"].stringValue
    }

}
