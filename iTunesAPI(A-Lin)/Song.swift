//
//  Song.swift
//  iTunesAPI(A-Lin)
//
//  Created by 蕭聿莘 on 2020/4/9.
//  Copyright © 2020 Kazuku. All rights reserved.
//

import Foundation

struct Song: Codable {
    var artistName: String
    let trackName: String
    var previewUrl: URL
    var artworkUrl100: URL
    var trackPrice: Double?
}
struct SongResults: Codable {
    var resultCount: Int
    var results: [Song]
}
