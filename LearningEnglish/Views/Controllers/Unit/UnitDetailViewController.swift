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
    @IBOutlet weak var vContentTop: UIView!
    @IBOutlet weak var heighVContent: NSLayoutConstraint!
    @IBOutlet weak var lbVocabulary: UILabel!
    
    let vmUnitDetail = UnitDetailViewModel()
    let disposeBag = DisposeBag()
    var listVocabulary = [Vocabulary]() {
        didSet {
            tbUnit.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
        configureTable()
    }
    
    override func setUpViews() {
        btnGame.setBorder(cornerRadius: 5)
        btnPractice.setBorder(cornerRadius: 5)
        btnTranslate.setBorder(borderWidth: 1, borderColor: LEVColor.buttonGreen, cornerRadius: 5)
        btnTranslate.setTitleColor(LEVColor.buttonGreen, for: .normal)
        lbVocabulary.textColor = LEVColor.titleGreen
    }
    
    override func setUpNavigation() {
        super.setUpNavigation()
        setTitle(title: "Unit1: Contacts")
        addBackToNavigation()
        
    }
    
    @IBAction func btnGameTapped() {
        let vc = PracticeFirstGameVC.initFromNib()
        self.push(controller: vc, animated: true)
    }
    
    func configureTable() {
        tbUnit.registerCustomCell(UnitTableViewCell.self, fromNib: true)
        tbUnit.registerCustomCell(UnitPracticeTableViewCell.self, fromNib: true)
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
            let cell = tbUnit.dequeueCustomCell(UnitPracticeTableViewCell.self)
            
            return cell
        } else {
            let cell = tbUnit.dequeueCustomCell(UnitTableViewCell.self)
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let actualPosition = scrollView.panGestureRecognizer.translation(in: scrollView.superview)
        self.view.layoutIfNeeded()
        if actualPosition.y > 0 {
            UIView.animate(withDuration: 0.5, animations: {
                self.heighVContent.constant = 100
                self.view.layoutIfNeeded()
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.heighVContent.constant = 0
               self.view.layoutIfNeeded()
            })
        }
    }
}
