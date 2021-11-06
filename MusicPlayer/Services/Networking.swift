//
//  Networking.swift
//  MusicPlayer
//
//  Created by 1 on 05.11.2021.
//

import UIKit
import Alamofire

class NetworkService {
    func fetchTracks(searchText: String, completion: @escaping (SearchResponse?) -> Void) {
        let url = "https://itunes.apple.com/search?term=\(searchText)&limit=25&media=music&limit=25"
       
        AF.request(url).responseData { dataResponse in
            if let error = dataResponse.error {
                print(error.localizedDescription)
                completion(nil)
                return
            }
            guard let data = dataResponse.data else { return }
            
            do {
                let objects = try JSONDecoder().decode(SearchResponse.self, from: data)
                print(objects)
                completion(objects)
            } catch {
                print("Failed to decode Json")
                completion(nil)
            }
        }
    }
}
