//
//  Podcast.swift
//  Podcast
//
//  Created by Christophe Bugnon on 10/11/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import Foundation

struct SearchResult: Decodable {
    var resultCount: Int
    var results: [Podcast]
}

struct Podcast: Decodable {
    var trackName: String
    var artistName: String
    var trackCount: Int
}
