//
//  WorkBookCell.swift
//  LearningEnglish
//
//  Created by Kai Pham on 1/6/18.
//  Copyright © 2018 Tien Dinh. All rights reserved.
//

import UIKit
import SDWebImage

class WorkBookCell: KBaseCollectionCellXib {

    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    
    var wordBook: WordBook? {
        didSet {
            guard let wb = wordBook else { return }
            lbName.text = wb.nameWordBook
            
            if let urlLocalStr = wb.urlImageLocal, let url = URL(string: urlLocalStr) {
                imgIcon.sd_setImage(with: url, placeholderImage: LEVImage.imgWordbookDefault)
            } else if let strImage = wb.urlWordBook, let url = URL(string: strImage) {
                imgIcon.sd_setImage(with: url, placeholderImage: LEVImage.imgWordbookDefault)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setUpViews() {
        super.setUpViews()
        self.setBorder(borderWidth: 1, borderColor: LEVColor.lineColor, cornerRadius: 0)
        lbName.font = LEVFont.fontBold13
    }

}
