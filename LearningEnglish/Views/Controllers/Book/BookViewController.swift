//
//  BookViewController.swift
//  LearningEnglish
//
//  Created by Tien Dinh on 12/3/17.
//  Copyright © 2017 Tien Dinh. All rights reserved.
//

import UIKit

class BookViewController: KBaseViewController {

    @IBOutlet weak var tbBook: UITableView!
    let cellId = "BookTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
    }
    
    override func setUpNavigation() {
        super.setUpNavigation()
        setTitle(title: "600 Essential English Words")
    }
    
    func configureTable() {
        tbBook.registerCustomCell(BookTableViewCell.self, fromNib: true)
        tbBook.delegate = self
        tbBook.dataSource = self
    }
}

extension BookViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbBook.dequeueCustomCell(BookTableViewCell.self, indexPath: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UnitViewController.initFromNib()
        self.push(controller: vc)
    }
}
