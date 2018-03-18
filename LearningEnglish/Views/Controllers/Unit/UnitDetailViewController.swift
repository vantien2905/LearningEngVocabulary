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
    
    private let vmUnitDetail = UnitDetailViewModel()
    private let disposeBag = DisposeBag()
    var isTranslate = true
    @IBAction func btnTranslateTapped() {
        isTranslate = !isTranslate
        !isTranslate ? btnTranslate.setTitle("Don't translate", for: .normal) : btnTranslate.setTitle("Translate", for: .normal)
        self.tbUnit.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
        configureTable()
    }
    
    static func configureViewController (idUnit: String, listVocabulary: [Vocabulary]?) -> UnitDetailViewController {
        let vc = UnitDetailViewController.initFromNib()
        vc.vmUnitDetail.inputs.idListUnit.value = idUnit
//        if let _listVocabulary = listVocabulary {
//            vc.vmUnitDetail.outputs.listVocabulary.value = _listVocabulary
//        }
        return vc
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
        tbUnit.delegate = self
        tbUnit.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
    }
    
    func bindData() {
        vmUnitDetail.outputs.listVocabulary.asObservable().bind(to: self.tbUnit.rx.items) {table, _, data in
            let cell = table.dequeueCustomCell(UnitTableViewCell.self)
            cell.vocabulary = data
            cell.isTranslate = self.isTranslate
            return cell
        }
    }
}

extension UnitDetailViewController: UITableViewDelegate {

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
