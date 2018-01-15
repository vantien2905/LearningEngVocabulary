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
    let cellId = "BookTableViewCell"
    
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
    }
    
   static func configureController(idWordbook: String?) -> ListUnitViewController {
        let vc = ListUnitViewController.initFromNib()
        vc.vmListUnit.setIdWordbook(idWordBook: idWordbook)
        return vc
    }
    
    private func vmBindToVC() {
        showError(message: "day la message")
        vmListUnit.getAllUnit()
        
        vmListUnit.outputs.listUnit.asObservable().bind(to: tbBook.rx.items) { table, _, unit in
            let cell = table.dequeueCustomCell(BookTableViewCell.self)
            cell.bindData(data: unit)
            return cell
        }.disposed(by: bag)
    }
}

// MARK: handle Table
extension ListUnitViewController: UITableViewDelegate {
    func configureTable() {
        tbBook.registerCustomCell(BookTableViewCell.self, fromNib: true)
        tbBook.delegate = self
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UnitDetailViewController.initFromNib()
        self.push(controller: vc)
    }
}