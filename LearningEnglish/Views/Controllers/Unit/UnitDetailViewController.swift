//
//  UnitViewController.swift
//  LearningEnglish
//
//  Created by Tien Dinh on 12/3/17.
//  Copyright © 2017 Tien Dinh. All rights reserved.
//

import UIKit
import RxSwift

class UnitDetailViewController: LEVBaseViewController {
    @IBOutlet weak var btnGame: UIButton!
    @IBOutlet weak var btnPractice: UIButton!
    @IBOutlet weak var btnTranslate: UIButton!
    
    @IBOutlet weak var tbUnit: UITableView!
    let vmUnitDetail = UnitDetailViewModel()
    let disposeBag = DisposeBag()

    let cellId = "UnitTableViewCell"
    let cellPracticeId = "UnitPracticeTableViewCell"
    
    var listVocabulary = [Vocabulary]() {
        didSet {
            tbUnit.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
        bindData()
    }
    
    override func setUpViews() {
        
        btnGame.layer.cornerRadius = 5
        btnPractice.layer.cornerRadius = 5
        btnTranslate.layer.cornerRadius = 5
        btnTranslate.layer.borderWidth = 1
        btnTranslate.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
    }
    
    override func setUpNavigation() {
        super.setUpNavigation()
        setTitle(title: "Unit1: Contacts")
        
    }
    
    func configureTable() {
        let nib = UINib(nibName: cellId, bundle: nil)
        tbUnit.register(nib, forCellReuseIdentifier: cellId)
        let practiceNib = UINib(nibName: cellPracticeId, bundle: nil)
        tbUnit.register(practiceNib, forCellReuseIdentifier: cellPracticeId)
        tbUnit.dataSource = self
        tbUnit.delegate = self
    }
    
    func bindData() {
        vmUnitDetail.outputs.listVocabulary.asObservable().subscribe(onNext: { _listVocabulary in
            self.listVocabulary = _listVocabulary
        }).disposed(by: disposeBag)
    }

}

extension UnitDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item == 20 {
            let cell = tbUnit.dequeueReusableCell(withIdentifier: cellPracticeId, for: indexPath)
            
            return cell
        } else {
            let cell = tbUnit.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! UnitTableViewCell
            if self.listVocabulary.count != 0 {
                cell.vocabulary = self.listVocabulary[indexPath.row]
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listVocabulary.count + 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.item == 9 {
            return 250
        } else {
            return 200
        }
    }
}
