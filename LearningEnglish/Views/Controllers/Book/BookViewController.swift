//
//  BookViewController.swift
//  LearningEnglish
//
//  Created by Tien Dinh on 12/3/17.
//  Copyright © 2017 Tien Dinh. All rights reserved.
//

import UIKit

class BookViewController: BaseViewController {

    @IBOutlet weak var tbBook: UITableView!
    let cellId = "BookTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
    }
    
    override func setUpView() {
        setTitle(title: "600 Essential English Words")
    }
    
    func configureTable() {
        let nib = UINib(nibName: "BookTableViewCell", bundle: nil)
        tbBook.register(nib, forCellReuseIdentifier: cellId)
        tbBook.delegate = self
        tbBook.dataSource = self
    }
}

extension BookViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbBook.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UnitViewController.initControllerFromNib()
        self.push(controller: vc)
    }
}
