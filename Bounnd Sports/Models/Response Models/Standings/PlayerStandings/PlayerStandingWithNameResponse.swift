//
//  PlayerStandingWithNameResponse.swift
//  LiveScore
//
//  Created by KHADER on 20/03/2023.
//

import Foundation
import SwiftyJSON

struct PlayerStandingWithNameResponse {

    let list: [PlayerStandingWithName]?

    init(_ json: JSON) {
        list = json["list"].arrayValue.map { PlayerStandingWithName($0) }
    }

}
