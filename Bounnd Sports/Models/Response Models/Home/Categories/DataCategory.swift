//
//  Data.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on March 27, 2023
//
import Foundation
import SwiftyJSON

struct DataCategory {

    let league: String?
    let leagueSlug: String?
    let section: String?
    let matches: [MatchCategory]?

    init(_ json: JSON) {
        league = json["league"].stringValue
        leagueSlug = json["league_slug"].stringValue
        section = json["section"].stringValue
        matches = json["matches"].arrayValue.map { MatchCategory($0) }
    }

}
