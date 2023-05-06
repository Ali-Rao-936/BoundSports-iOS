//
//  File.swift
//  Shake Ball Sports
//
//  Created by Qoo on 13/12/2022.
//

import Foundation
import SwiftyJSON

struct Banner {

    let image: String?
    let redirectUrl: String?
    let openType: String?
    let width: Int?
    let height: Int?

    init(_ json: JSON) {
        image = json["image"].stringValue
        redirectUrl = json["redirect_url"].stringValue
        openType = json["open_type"].stringValue
        width = json["width"].intValue
        height = json["height"].intValue
    }

}
