//
//  EsportsViewModel.swift
//  Bounnd Sports
//
//  Created by Qoo on 28/04/2023.
//

import Foundation


protocol EsportsViewModelDelegate{
    func didFinishEsportsListFetch()
    func didFinishEsportsLeaguesFetch()
    func didFinishFetchMatchDetail()
}

class EsportsViewModel{
    
    var delegate:EsportsViewModelDelegate?
    var esportsListing:[DataEsports]?
    var esportsSearchListing:[DataEsports]?
    var esportsLeagues:[DataLeagues]?
    var matchDetail:MatchDetailBase?
    
    func getAllEsportsMatches(page : String){
        ZeyutyAPI().getAllEsportsMatches(pageNumber: page, completion: {response in
            if page == "1"{
                self.esportsListing=response.data
                
            }
            else{
                self.esportsListing?.append(contentsOf: response.data ?? [])
            }
            self.delegate?.didFinishEsportsListFetch()
        }, failed: {error in
            Utility.showErrorSnackView(message: error)
        })
    }
    func getEsportsMatchesFor(esportsType:String){
        ZeyutyAPI().getEsportsMatchesFor(esportsType: esportsType, pageNumber: "1", completion: {response in
            self.esportsListing=response.data
            self.delegate?.didFinishEsportsListFetch()
        }, failed: {error in
            Utility.showErrorSnackView(message: error)
        })
    }
    func getEsportsLeaguesFor(esportsType:String){
        ZeyutyAPI().getEsportsLeaguesFor(esportsType: esportsType, completion: { response in
            var validleagues : [DataLeagues] = []
            response.forEach({element in
                if (element.logoUrl != nil && element.logoUrl != "" && element.level != nil) {
                    validleagues.append(element)
                }
            })
            self.esportsLeagues = validleagues
            self.delegate?.didFinishEsportsLeaguesFetch()
        }, failed: { error in
            Utility.showErrorSnackView(message: error)
        })
    }
    func getEsportsMatchDetail(matchID:String){
        ZeyutyAPI().getMatchDetail(matchID: matchID, completion: { response in
            self.matchDetail=response
            self.delegate?.didFinishFetchMatchDetail()
        }, failed: { error in
            Utility.showErrorSnackView(message:error)}
        )
    }
}
