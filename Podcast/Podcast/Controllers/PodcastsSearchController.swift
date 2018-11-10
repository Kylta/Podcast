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
        nib = "PodcastCell"
        super.viewDidLoad()

        tableView.rowHeight = 132
        setupSearchBar()
    }

    func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        APIService.shared.fetchPodcasts(searchText: searchText) { (podcasts) in
            self.items = podcasts
            self.tableView.reloadData()
        }
    }

    // MARK: - TableView

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerLabel = UILabel()
        headerLabel.text = "No results, please enter a search query."
        headerLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        headerLabel.textColor = .purple
        headerLabel.textAlignment = .center

        if !searchController.searchBar.text!.isEmpty {
            headerLabel.text = "You're almost there, keep typing..."
        }
        return headerLabel
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return items.isEmpty ? 250 : 0
    }
}
