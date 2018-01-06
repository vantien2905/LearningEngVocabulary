//
//  HomeViewController.swift
//  LearningEnglish
//
//  Created by Tien Dinh on 11/29/17.
//  Copyright © 2017 Tien Dinh. All rights reserved.
//

import UIKit

class HomeViewController: KBaseViewController {
    @IBOutlet weak var cltBook: UICollectionView!

    let cellId = "cltBookCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollection()
        // Do any additional setup after loading the view.
    }
    
    override func setUpViews() {
        setTitle(title: "4000 essential english words")
    }
    
    func configureCollection() {
        
        cltBook.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellId)
        cltBook.delegate = self
        cltBook.dataSource = self
        cltBook.alwaysBounceVertical = true
        cltBook.contentInset.top = 5
        cltBook.contentInset.left = 5
        cltBook.contentInset.right = 5
    }

}

extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cltBook.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/2 - 7.5, height: view.frame.width/2 - 7.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = BookViewController.initFromNib()
        self.push(controller: vc)
    }
}
