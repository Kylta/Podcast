//
//  EpisodeCell.swift
//  Podcast
//
//  Created by Christophe Bugnon on 11/11/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit

class EpisodeCell: GenericCell<Episode> {

    @IBOutlet weak var EpisodeImageView: UIImageView!
    @IBOutlet weak var pubDateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override var item: Episode! {
        didSet {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM dd, yyyy"
            pubDateLabel.text = dateFormatter.string(from: item.pubDate)
            titleLabel?.text = item.title
            descriptionLabel.text = item.description
        }
    }
}
