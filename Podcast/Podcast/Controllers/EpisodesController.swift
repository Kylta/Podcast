//
//  EpisodesController.swift
//  Podcast
//
//  Created by Christophe Bugnon on 10/11/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit
import FeedKit

class EpisodesController: GenericTableViewController<EpisodeCell, Episode> {

    var podcast: Podcast! {
        didSet {
            navigationItem.title = podcast.trackName
            fetchEpisodes()
        }
    }

    override func viewDidLoad() {
        nib = "EpisodeCell"
        super.viewDidLoad()

        tableView.rowHeight = 132
        tableView.reloadData()
    }

    private func fetchEpisodes() {
        guard let feedUrl = podcast.feedUrl else { return }
        let secureUrl = feedUrl.contains("https") ? feedUrl : feedUrl.replacingOccurrences(of: "http", with: "https")
        guard let url = URL(string: secureUrl) else { return }
        let parser = FeedParser(URL: url)
        parser?.parseAsync(result: { (result) in
            print("Successfully parse feed:", result.isSuccess)

            if let err = result.error {
                print("Failed to parse:", err)
            }

            guard let feed = result.rssFeed, result.isSuccess else { return }
            feed.items?.forEach {
                let episode = Episode(feedItem: $0)
                self.items.append(episode)
            }

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
}
