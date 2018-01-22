//
//  UnitPracticeTableViewCell.swift
//  LearningEnglish
//
//  Created by Tien Dinh on 12/3/17.
//  Copyright © 2017 Tien Dinh. All rights reserved.
//

import UIKit

class UnitPracticeTableViewCell: LEVBaseTableCellXib {
    @IBOutlet weak var vBackground: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpView() {
        vBackground.layer.cornerRadius = 10
    }
    
}
