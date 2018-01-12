//
//  WordBookViewController.swift
//  LearningEnglish
//
//  Created by Kai Pham on 1/6/18.
//  Copyright © 2018 Tien Dinh. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class WordBookViewController: KBaseViewController {
    
    @IBOutlet weak var cvWordBook: UICollectionView!

    //---
    private let vmWordBook = WordBookViewModel()
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollection()
        vmBindToVC()
    }
    
    private func vmBindToVC() {
        vmWordBook.getAllWordBook()
        vmWordBook.outputs.listWordBook.asObservable()
            .bind(to: cvWordBook.rx.items) { collection, index, wordbook in
                let indexPath = IndexPath(item: index, section: 0)
                let cell = collection.dequeueCustomCell(WorkBookCell.self, indexPath: indexPath)
                cell.wordBook = wordbook
                return cell
        }.disposed(by: bag)
        
    }
    
    override func setUpNavigation() {
        super.setUpNavigation()
        setTitle(title: "English Word Books")
    }
}

// MARK: handle collection
extension WordBookViewController: UICollectionViewDelegateFlowLayout {
    private func configureCollection() {
        cvWordBook.registerCustomCell(WorkBookCell.self, fromNib: true)
        cvWordBook.backgroundColor = .clear
        cvWordBook.showsVerticalScrollIndicator = false
        cvWordBook.delegate = self
        cvWordBook.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 30, right: 0)
        
        if let layout = cvWordBook.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumLineSpacing = 10
            layout.minimumInteritemSpacing = 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 10) / 2
        let height = collectionView.frame.height / 2.5
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let id = self.vmWordBook.getWordBookIdAt(index: indexPath.item)
        let vc = ListUnitViewController.configureController(idWordbook: id)
        
        self.push(controller: vc, animated: true)
    }
}
