//
//  WebService.swift
//  SportzAssigment
//
//  Created by Dinesh Tanwar on 12/01/21.
//  Copyright © 2021 Dinesh Tanwar. All rights reserved.
//

import Foundation

class WebService {
    
    private var dataTask: URLSessionDataTask?

    func getMatchData(completion: @escaping (Result<MatchData, Error>) -> Void) {
        
        let urlString = "https://cricket.yahoo.net/sifeeds/cricket/live/json/sapk01222019186652.json"
        
        guard let url = URL(string: urlString) else {return}
        
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(MatchData.self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            } catch let error {
                completion(.failure(error))
            }
        }
        dataTask?.resume()
    }
}
