//
//  Track Model.swift
//  MusicPlayer
//
//  Created by 1 on 04.11.2021.
//

import Foundation
struct SearchResponse: Codable {
    let resultCount: Int
    let results: [Track]
}
struct Track: Codable {
    let trackName: String
    let collectionName: String?
    let artistName: String
    let artworkUrl100: String?
}
