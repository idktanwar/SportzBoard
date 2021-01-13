//
//  MatchDetailViewModel.swift
//  SportzAssigment
//
//  Created by Dinesh Tanwar on 12/01/21.
//  Copyright © 2021 Dinesh Tanwar. All rights reserved.
//

import Foundation

struct MatchDataViewModel {
    
    private var apiService = WebService()
    private var matchData  = [MatchData]()

    func numberOfRowsInSection(section: Int) -> Int {
        //current matches 1
        return matchData.count
    }

    mutating func addMatchViewModel(_ vm: MatchData){
        self.matchData.append(vm)
    }
    
    func modelAt(_ index: Int) -> MatchData {
        return self.matchData[index]
    }
    
}




