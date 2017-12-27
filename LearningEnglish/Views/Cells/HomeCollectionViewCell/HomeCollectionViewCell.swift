//
//  HomeCollectionViewCell.swift
//  LearningEnglish
//
//  Created by Tien Dinh on 11/29/17.
//  Copyright © 2017 Tien Dinh. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgBook: UIImageView!
    @IBOutlet weak var lbBookName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
        // Initialization code
    }
    
    func setUpView() {
        lbBookName.textColor = LEVColor.blueColor
        imgBook.backgroundColor = .orange
    }

}
