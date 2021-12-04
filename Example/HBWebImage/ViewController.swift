//
//  ViewController.swift
//  HBWebImage
//
//  Created by haoboxuxu on 11/25/2021.
//  Copyright (c) 2021 haoboxuxu. All rights reserved.
//

import UIKit
import HBWebImage

class ViewController: UIViewController {
    
    var prefetchingCache: [IndexPath: UIImage?] = [:]
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ImageCell.nib(), forCellReuseIdentifier: ImageCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.prefetchDataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ImageCell.identifier) as! ImageCell
        if let image = prefetchingCache[indexPath] {
            cell.cellImageView.image = image
        } else {
            cell.cellImageView.hbSetImage(with: URL(string: urls[indexPath.row]),
                                          placeholderImage: UIImage(named: "ph")) { [weak self] image in
                self?.prefetchingCache[indexPath] = image
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

extension ViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            print("👾prefetchRowsAt \(indexPath.row)")
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageCell.identifier) as! ImageCell
            if let image = prefetchingCache[indexPath] {
                cell.cellImageView.image = image
            } else {
                cell.cellImageView.hbSetImage(with: URL(string: urls[indexPath.row]),
                                              placeholderImage: UIImage(named: "ph")) { [weak self] image in
                    self?.prefetchingCache[indexPath] = image
                }
            }
        }
    }
}
