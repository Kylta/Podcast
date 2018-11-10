//
//  PodcastCell.swift
//  Podcast
//
//  Created by Christophe Bugnon on 10/11/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit

class PodcastCell: GenericCell<Podcast> {

    @IBOutlet weak var podcastImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var episodeCountLabel: UILabel!

    override var item: Podcast! {
        didSet {
            trackNameLabel.text = item.trackName
            artistNameLabel.text = item.artistName
            episodeCountLabel.text = String(item.trackCount)
        }
    }
}
