//
//  EpisodesController.swift
//  Podcast
//
//  Created by Christophe Bugnon on 10/11/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit
import FeedKit

struct Episode {
    var title: String
}

class EpisodeCell: GenericCell<Episode> {

    override var item: Episode! {
        didSet {
            textLabel?.text = item.title
        }
    }

}

class EpisodesController: GenericTableViewController<EpisodeCell, Episode> {

    var podcast: Podcast! {
        didSet {
            navigationItem.title = podcast.trackName

            fetchEpisodes()
        }
    }

    private func fetchEpisodes() {
        print("Looking for episodes at feed url:", podcast.feedUrl ?? "")

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
            let episode = Episode(title: feed.title!)
            self.items.append(episode)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
