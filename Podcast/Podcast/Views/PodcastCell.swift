//
//  PodcastCell.swift
//  Podcast
//
//  Created by Christophe Bugnon on 10/11/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit

class PodcastCell: GenericCell<Podcast> {
    override var item: Podcast! {
        didSet {
            textLabel?.text = "\(item.trackName)\n\(item.artistName)"
            textLabel?.numberOfLines = 0
            imageView?.image = UIImage(named: "appicon")
        }
    }
}
