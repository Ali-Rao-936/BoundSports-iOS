//
//  MatchDetailViewModel.swift
//  Shoot Sports
//
//  Created by Yahya on 3/25/23.
//

import Foundation

protocol MatchDetailViewModelDelegate{
    func didFinishFetchMatchDetail()
}

class MatchDetailViewModel{
    var delegate:MatchDetailViewModelDelegate?
    var matchDetail:MatchDetailFootballBase?
    
    func getMatchDetails(slug:String,game:String){
    
        HomeAPI().getFootballMatchDetail(slug: slug, completion: { response in
            self.matchDetail=response
            self.delegate?.didFinishFetchMatchDetail()
        }, failed: { error in
            Utility.showErrorSnackView(message:error)
        },game: game)
    }
}
