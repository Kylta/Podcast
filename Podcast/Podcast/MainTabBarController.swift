//
//  ViewController.swift
//  Podcast
//
//  Created by Christophe Bugnon on 10/11/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        UINavigationBar.appearance().prefersLargeTitles = true

        tabBar.tintColor = .purple

        viewControllers = [
            generateNavigationController(for: PodcastsSearchController(), title: "Search", image: UIImage(named: "search")!),
            generateNavigationController(for: UIViewController(), title: "Favorites", image: UIImage(named: "favorites")!),
            generateNavigationController(for: UIViewController(), title: "Downloads", image: UIImage(named: "downloads")!)
        ]
    }

    func generateNavigationController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        rootViewController.navigationItem.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        return navController
    }

}
