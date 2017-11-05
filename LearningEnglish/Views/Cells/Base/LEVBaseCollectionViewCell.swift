//
//  LEVBaseCollectionViewCell.swift
//  LearningEnglish
//
//  Created by Kai Pham on 11/5/17.
//  Copyright © 2017 Tien Dinh. All rights reserved.
//

import UIKit

class LEVBaseCollectionViewCell: UICollectionViewCell {
    let lineBottom: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = LEVColor.lineColor
        lineView.isHidden = true
        return lineView
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        clipsToBounds = true
        addSubview(lineBottom)
        lineBottom.anchor(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 1)
    }
}
