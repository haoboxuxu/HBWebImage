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
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ImageCell.nib(), forCellReuseIdentifier: ImageCell.identifier)
        return tableView
    }()
    
    let urls: [String] = [
        "https://tse2-mm.cn.bing.net/th/id/OIP-C.a5ZuRapJeQuBAO4w-3HC3AHaE8?w=268&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse3-mm.cn.bing.net/th/id/OIP-C.p19AS1V9GfZ3pNJEiaGRaAHaLw?w=115&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse3-mm.cn.bing.net/th/id/OIP-C.zEza9ipqeNwZFSzcVFo9owHaEK?w=319&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse1-mm.cn.bing.net/th/id/OIP-C.j6Aga9LZs1BbYxIs_kZsBgHaE7?w=258&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse3-mm.cn.bing.net/th/id/OIP-C.c0d8lB1lq49Z-nfwg818UwHaDG?w=339&h=146&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse1-mm.cn.bing.net/th/id/OIP-C.29stg6q6YB7kh6mPcbiqwwHaEo?w=213&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
        
        "https://tse2-mm.cn.bing.net/th/id/OIP-C.a5ZuRapJeQuBAO4w-3HC3AHaE8?w=268&h=180&c=7&r=0&o=5&dpr=2&pid=1.7", // duplicate
        "https://tse3-mm.cn.bing.net/th/id/OIP-C.p19AS1V9GfZ3pNJEiaGRaAHaLw?w=115&h=180&c=7&r=0&o=5&dpr=2&pid=1.7", // duplicate
        "https://tse3-mm.cn.bing.net/th/id/OIP-C.zEza9ipqeNwZFSzcVFo9owHaEK?w=319&h=180&c=7&r=0&o=5&dpr=2&pid=1.7", // duplicate
        "https://tse1-mm.cn.bing.net/th/id/OIP-C.j6Aga9LZs1BbYxIs_kZsBgHaE7?w=258&h=180&c=7&r=0&o=5&dpr=2&pid=1.7", // duplicate
        "https://tse3-mm.cn.bing.net/th/id/OIP-C.c0d8lB1lq49Z-nfwg818UwHaDG?w=339&h=146&c=7&r=0&o=5&dpr=2&pid=1.7", // duplicate
        "https://tse1-mm.cn.bing.net/th/id/OIP-C.29stg6q6YB7kh6mPcbiqwwHaEo?w=213&h=180&c=7&r=0&o=5&dpr=2&pid=1.7", // duplicate
        
        "https://tse1-mm.cn.bing.net/th/id/OIP-C.zEo5kJQH2SkN_MGCGI25cQHaE6?w=249&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse4-mm.cn.bing.net/th/id/OIP-C.XASkBor-8f81fMMoDzNA5QHaEK?w=285&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse2-mm.cn.bing.net/th/id/OIP-C.d7URrSU6L6-EoTw8oiM7_gHaFj?w=210&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse2-mm.cn.bing.net/th/id/OIP-C.U8AMYwQJ53R3jCz0bB08uwHaEk?w=318&h=196&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse4-mm.cn.bing.net/th/id/OIP-C.AMaCocgpfx7tlLc9p_M_dwEsDI?w=295&h=196&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse3-mm.cn.bing.net/th/id/OIP-C.GakSDRGGg0pSBdx2rTU9bQHaFj?w=213&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse1-mm.cn.bing.net/th/id/OIP-C.2itQdNbgsNMOs2e0XvTwWgHaEK?w=284&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse4-mm.cn.bing.net/th/id/OIP-C.Dby8Biy9i9xkls4hlwzMmAHaD2?w=326&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse1-mm.cn.bing.net/th/id/OIP-C.pDWW4jVYWa-BQplKQTgDFwHaE7?w=269&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse4-mm.cn.bing.net/th/id/OIP-C.iZNmHt-y_HS_PteoweEX3QHaFZ?w=246&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse1-mm.cn.bing.net/th/id/OIP-C.WHIthpYuHCuKsdpc9y7wYgHaEK?w=324&h=182&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse3-mm.cn.bing.net/th/id/OIP-C.jX6abxo3Q8_YdCmQUoIr-QHaE8?w=238&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse2-mm.cn.bing.net/th/id/OIP-C.-wVPjOOzxDyA3ytL5nUYOAHaE8?w=265&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse3-mm.cn.bing.net/th/id/OIP-C.QHbXUc4rNRa2bPX3Fz27QgHaFG?w=195&h=183&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse1-mm.cn.bing.net/th/id/OIP-C.jDbZt4z7oEkG646M87BbJQHaE6?w=305&h=203&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse4-mm.cn.bing.net/th/id/OIP-C.G5X5puE554jaVSgI6StfUgHaEK?w=324&h=182&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse1-mm.cn.bing.net/th/id/OIP-C.zy6Z_XPZiILpMQ8OVIQvsAHaEK?w=324&h=182&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse2-mm.cn.bing.net/th/id/OIP-C.NDMFw7-XaYho90moIzT5KAHaF4?w=211&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse2-mm.cn.bing.net/th/id/OIP-C.GSaityYi22_sRwvYs25ZMgHaE8?w=261&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse3-mm.cn.bing.net/th/id/OIP-C.zeFl4hBALRv05R9w9nB90AHaE8?w=201&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse1-mm.cn.bing.net/th/id/OIP-C.2bVBIpkcBa1YBjGw1hEJOgHaFE?w=231&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse3-mm.cn.bing.net/th/id/OIP-C.nSAxAV_kLkPCcRDkNZZuNgHaE7?w=265&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse3-mm.cn.bing.net/th/id/OIP-C.9-m2EKm8WfgKFyXU8LHGmQHaE2?w=282&h=185&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse3-mm.cn.bing.net/th/id/OIP-C.aowN9wy4Ok-t1r6vc6FJSAHaE7?w=267&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse3-mm.cn.bing.net/th/id/OIP-C.LZkH_dU2D7ye5XH3NJnyKwHaE7?w=248&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse3-mm.cn.bing.net/th/id/OIP-C.8JRLqCCbgqw2ZSihuikAogHaEJ?w=332&h=186&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse4-mm.cn.bing.net/th/id/OIP-C.qLEYaNcV3kevE1c7cz0RYQHaEJ?w=331&h=186&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse3-mm.cn.bing.net/th/id/OIP-C.r0sDelDEZmDOFiBHc4K_uwHaE7?w=276&h=183&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse1-mm.cn.bing.net/th/id/OIP-C.ph9psO2FbnvuyUWFNec2gwHaFV?w=228&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse1-mm.cn.bing.net/th/id/OIP-C.idV79x_o2QPn2kuuRk0qzAHaE8?w=305&h=203&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse2-mm.cn.bing.net/th/id/OIP-C.2EaUaxMA2c6u2SeaQJswgQHaDt?w=342&h=175&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse2-mm.cn.bing.net/th/id/OIP-C.z59UInL5jnfzrgpdOOUG7AEyDM?w=266&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse4-mm.cn.bing.net/th/id/OIP-C._uNIfxgZL3jt1ksdfq2LwAHaF7?w=209&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse2-mm.cn.bing.net/th/id/OIP-C.iWPZPtWQDiC__2w4V8nRxgHaEi?w=290&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse2-mm.cn.bing.net/th/id/OIP-C.8yy9k7WSASwXaNJ5XnfQbQHaEE?w=291&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse1-mm.cn.bing.net/th/id/OIP-C.KYPK4DIgWIkNP8q0Mp61cwHaE7?w=270&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse1-mm.cn.bing.net/th/id/OIP-C.f-se33jTnBetcZ_YSQNmjwHaEW?w=254&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
        "https://tse4-mm.cn.bing.net/th/id/OIP-C.1mAaJ82bzijpN05i5qYz6AHaCH?w=289&h=99&c=7&r=0&o=5&dpr=2&pid=1.7",
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
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
        cell.cellImageView.hbSetImage(with: URL(string: urls[indexPath.row]),
                                  placeholderImage: UIImage(named: "ph")!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}


