//
//  GenericTableViewController.swift
//  Podcast
//
//  Created by Christophe Bugnon on 10/11/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

//swiftlint:disable force_cast
import UIKit

class GenericCell<U>: UITableViewCell {
    var item: U!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    func setupViews() {}

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class GenericTableViewController<T: GenericCell<U>, U>: UITableViewController {

    var items = [U]()
    var nib: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        let reuseIdentifier = NSStringFromClass(T.self)

        if let nib = nib {
            let nib = UINib(nibName: nib, bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: reuseIdentifier)
        } else {
            tableView.register(T.self, forCellReuseIdentifier: reuseIdentifier)
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = NSStringFromClass(T.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! T
        cell.item = items[indexPath.row]
        return cell
    }
}
