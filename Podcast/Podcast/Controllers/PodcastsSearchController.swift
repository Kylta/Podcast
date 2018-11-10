//
//  PodcastController.swift
//  Podcast
//
//  Created by Christophe Bugnon on 10/11/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit

class PodcastsSearchController: GenericTableViewController<PodcastCell, Podcast>, UISearchBarDelegate {

    var searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()

        items = [
            Podcast(name: "LetsBuildThatApp", artistName: "Brian Voong"),
            Podcast(name: "Some podcast", artistName: "Some artists")
        ]

        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
