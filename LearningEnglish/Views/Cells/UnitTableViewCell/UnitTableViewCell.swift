//
//  UnitTableViewCell.swift
//  LearningEnglish
//
//  Created by Tien Dinh on 12/3/17.
//  Copyright © 2017 Tien Dinh. All rights reserved.
//

import UIKit
import SDWebImage

class UnitTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgWord: UIImageView!
    @IBOutlet weak var lbWord: UILabel!
    @IBOutlet weak var lbVnRaw: UILabel!
    @IBOutlet weak var lbVietnameseWord: UILabel!
    @IBOutlet weak var lbExample: UILabel!
    @IBOutlet weak var lbViewnameseExample: UILabel!
    
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
        
    }
}
