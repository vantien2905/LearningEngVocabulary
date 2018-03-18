//
//  BookTableViewCell.swift
//  LearningEnglish
//
//  Created by Tien Dinh on 12/3/17.
//  Copyright © 2017 Tien Dinh. All rights reserved.
//

import UIKit

protocol ListUnitTableViewCellDelegate: class {
    func isDownloadUnit(idUnit: String?)
}

class ListUnitTableViewCell: LEVBaseTableCellXib {
    
    @IBOutlet weak var imgUnit: UIImageView!
    @IBOutlet weak var lbUnitName: UILabel!
    @IBOutlet weak var vPercentScore: LEVPercentView!
    @IBOutlet weak var lbScore: UILabel!
    
    weak var delegate: ListUnitTableViewCellDelegate?
    var idUnit: String?
    override func setUpViews() {
        super.setUpViews()
        lineBottom.isHidden = false
        imgUnit.setBorder(borderWidth: 1, borderColor: LEVColor.lineColor, cornerRadius: 0)
    }
    
    func bindData(data: LEVUnit) {
        if let _idUnit = data.idUnit {
            self.idUnit = _idUnit
        }
        if let url = URL(string: data.urlUnit!) {
            self.imgUnit.sd_setImage(with: url, placeholderImage: LEVImage.imgUnitDefault)
        }
        self.lbUnitName.text = data.nameUnit
        self.lbScore.text = " \(data.score.value*)/100 "
        if let _score = data.score.value {
            vPercentScore.setPercent(percent: CGFloat(_score))
        }
    }
    
    @IBAction func btnDownloadTapped() {
        delegate?.isDownloadUnit(idUnit: idUnit)
    }
    
}
