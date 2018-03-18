//
//  BookViewController.swift
//  LearningEnglish
//
//  Created by Tien Dinh on 12/3/17.
//  Copyright © 2017 Tien Dinh. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ListUnitViewController: LEVBaseViewController {
    @IBOutlet weak var tbBook: UITableView!
    
    var idWordBook: String?
    
    private let vmListUnit = ListUnitViewModel()
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
        vmBindToVC()
    }
    
    override func setUpNavigation() {
        super.setUpNavigation()
        setTitle(title: "600 Essential English Words")
        addBackToNavigation()
    }
    
   static func configureController(idWordbook: String?) -> ListUnitViewController {
        let vc = ListUnitViewController.initFromNib()
        vc.vmListUnit.setIdWordbook(idWordBook: idWordbook)
        return vc
    }
    
    private func vmBindToVC() {
        
        vmListUnit.outputs.listUnit.asObservable().bind(to: tbBook.rx.items) { table, _, unit in
            let cell = table.dequeueCustomCell(ListUnitTableViewCell.self)
            cell.bindData(data: unit)
            cell.delegate = self
            return cell
        }.disposed(by: bag)
    }
}

// MARK: handle Table
extension ListUnitViewController: UITableViewDelegate {
    func configureTable() {
        tbBook.registerCustomCell(ListUnitTableViewCell.self, fromNib: true)
        tbBook.delegate = self
        tbBook.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 30, right: 0)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let idUnit = vmListUnit.outputs.listUnit.value[indexPath.item].idUnit&
        let listVocabulary = vmListUnit.outputs.listVocabulary.value
        let vc = UnitDetailViewController.configureViewController(idUnit: idUnit, listVocabulary: listVocabulary)
        
        self.push(controller: vc)
    }
}

extension ListUnitViewController: ListUnitTableViewCellDelegate {
    func isDownloadUnit(idUnit: String?) {
        self.vmListUnit.inputs.idUnit.value = idUnit
    }
}
