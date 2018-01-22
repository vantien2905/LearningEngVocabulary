//
//  UnitTableViewCell.swift
//  LearningEnglish
//
//  Created by Tien Dinh on 12/3/17.
//  Copyright © 2017 Tien Dinh. All rights reserved.
//

import UIKit
import SDWebImage

class UnitTableViewCell: LEVBaseTableCellXib {
    
    @IBOutlet weak var imgWord: UIImageView!
    @IBOutlet weak var lbWord: LEVLabel!
    @IBOutlet weak var lbVnRaw: LEVLabel!
    @IBOutlet weak var lbVietnameseWord: LEVLabel!
    @IBOutlet weak var lbExample: LEVLabel!
    
    var vocabulary: Vocabulary? {
        didSet {
            setData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData() {
        guard let _vocabulary = vocabulary else {return}
        lbWord.text = _vocabulary.english
        lbVnRaw.text = _vocabulary.vnRaw
        lbVietnameseWord.text = _vocabulary.vietnamese
        lbExample.text = _vocabulary.example
        guard let _thumbUrl = _vocabulary.thumbUrl else {return}
        let url = URL(string: _thumbUrl)
        imgWord.sd_setImage(with: url, placeholderImage: LEVImage.imgSetting)
        lbWord.textColor = LEVColor.titleGreen
    }
    
}

class LEVLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    func setUpView() {
        self.textColor = LEVColor.blackColor
    }
    
    func setContent(title: String, colorText: UIColor = LEVColor.blackColor,  font: UIFont = LEVFont.fontRegular15) {
        self.text = title
        self.font = font
        self.textColor = colorText
    }
    
}
