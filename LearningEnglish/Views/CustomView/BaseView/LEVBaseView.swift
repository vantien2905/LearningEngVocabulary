//
//  LEVBaseView.swift
//  LearningEnglish
//
//  Created by Tien Dinh on 11/5/17.
//  Copyright © 2017 Tien Dinh. All rights reserved.
//

import UIKit

class LEVBaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpViews()
    }
    
    func setUpViews() {
        
    }
}
