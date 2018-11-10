//
//  PodcastController.swift
//  Podcast
//
//  Created by Christophe Bugnon on 10/11/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit
import Alamofire

class PodcastsSearchController: GenericTableViewController<PodcastCell, Podcast>, UISearchBarDelegate {

    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()

        setupSearchBar()
    }

    func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let url = "https://itunes.apple.com/search"
        let parameters = ["term": searchText, "media": "podcast"]

        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).response { (dataResponse) in
            if let err = dataResponse.error {
                print("Failed to contact itunes API:", err)
                return
            }

            guard let data = dataResponse.data else { return }

            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                self.items = searchResult.results
                self.tableView.reloadData()
            } catch let decodeErr {
                print("Failed to decode Search Result:", decodeErr)
            }
        }
    }
}
