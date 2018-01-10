//
//  CheckBoxView.swift
//  LearningEnglish
//
//  Created by Tu on 1/6/18.
//  Copyright © 2018 Tien Dinh. All rights reserved.
//

import UIKit
import RxSwift

class CheckBoxView: KBaseViewXib {
    
    @IBOutlet weak var imgBox: UIImageView!
    @IBOutlet weak var btnTickBox: UIButton!
    
    var isCheck = Variable<Bool>(false)
    
    override func setUpViews() {
        imgBox.image = LEVImage.imgUncheckedBox
    }
    
    @IBAction func btnTickBoxTapped() {
        isCheck.value = !isCheck.value
        imgBox.image = isCheck.value == true ? LEVImage.imgCheckedBox : LEVImage.imgUncheckedBox
    }
}
