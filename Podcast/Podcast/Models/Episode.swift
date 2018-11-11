//
//  Episode.swift
//  Podcast
//
//  Created by Christophe Bugnon on 11/11/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import Foundation
import FeedKit

struct Episode {
    let title: String
    let pubDate: Date
    let description: String

    init(feedItem: RSSFeedItem) {
        self.title = feedItem.title ?? ""
        self.pubDate = feedItem.pubDate ?? Date()
        self.description = feedItem.description ?? ""
    }
}
