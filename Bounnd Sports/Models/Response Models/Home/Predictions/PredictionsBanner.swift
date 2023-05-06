//
//  Banner.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on March 14, 2023
//
import Foundation
import SwiftyJSON 

struct PredictionsBanner {

    let id: String?
    let name: String?
    let imageUrl: String?
    let type: String?
    let target: String?

    init(_ json: JSON) {
        id = json["id"].stringValue
        name = json["name"].stringValue
        imageUrl = json["image_url"].stringValue
        type = json["type"].stringValue
        target = json["target"].stringValue
    }

}
