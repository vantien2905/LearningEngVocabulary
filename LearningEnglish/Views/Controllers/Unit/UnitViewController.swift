//
//  UnitViewController.swift
//  LearningEnglish
//
//  Created by Tien Dinh on 12/3/17.
//  Copyright © 2017 Tien Dinh. All rights reserved.
//

import UIKit

class UnitViewController: KBaseViewController {
    @IBOutlet weak var btnGame: UIButton!
    @IBOutlet weak var btnPractice: UIButton!
    @IBOutlet weak var btnTranslate: UIButton!
    
    
    @IBOutlet weak var tbUnit: UITableView!

    let cellId = "UnitTableViewCell"
    let cellPracticeId = "cellPractice"
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
    }
    
    override func setUpViews() {
        setTitle(title: "Unit1: Contacts")
        btnGame.layer.cornerRadius = 5
        btnPractice.layer.cornerRadius = 5
        btnTranslate.layer.cornerRadius = 5
        btnTranslate.layer.borderWidth = 1
        btnTranslate.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
    }
    
    func configureTable() {
        let nib = UINib(nibName: "UnitTableViewCell", bundle: nil)
        tbUnit.register(nib, forCellReuseIdentifier: cellId)
        let practiceNib = UINib(nibName: "UnitPracticeTableViewCell", bundle: nil)
        tbUnit.register(practiceNib, forCellReuseIdentifier: cellPracticeId)
        tbUnit.dataSource = self
        tbUnit.delegate = self
    }

}

extension UnitViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item == 9 {
            let cell = tbUnit.dequeueReusableCell(withIdentifier: cellPracticeId, for: indexPath)
            
            return cell
        } else {
            let cell = tbUnit.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.item == 9 {
            return 250
        } else {
            return 200
        }
    }
}
