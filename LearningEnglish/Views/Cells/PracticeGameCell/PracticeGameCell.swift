//
//  PracticeGameCell.swift
//  LearningEnglish
//
//  Created by Tu DV on 1/22/18.
//  Copyright © 2018 Tien Dinh. All rights reserved.
//

import UIKit

class PracticeGameCell: LEVBaseTableCell {
    
    @IBOutlet weak var imgCheckBox: UIImageView!
    @IBOutlet weak var lbWord: UILabel!
    
    override func setUpViews() {
        self.backgroundColor = LEVColor.background
    }
}
