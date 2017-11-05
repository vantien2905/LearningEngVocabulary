//
//  LEVTextField.swift
//  LearningEnglish
//
//  Created by Tien Dinh on 11/5/17.
//  Copyright © 2017 Tien Dinh. All rights reserved.
//

import UIKit

class LEVTextField: LEVBaseView {
    let vBackground: UIView = {
        let view = UIView()
        view.backgroundColor = LEVColor.grayColor
        view.layer.borderWidth = 1
        view.layer.borderColor = LEVColor.lineColor.cgColor
        view.layer.cornerRadius = 5
        return view
    }()
    
    let textField: UITextField = {
        let tf = UITextField()
        
        return tf
    }()
    
    let lbTitle: UILabel = {
        let lb = UILabel()
        lb.font = LEVFont.fontBold15
        lb.textColor = LEVColor.blackColor
        
        return lb
    }()
    override func setUpViews() {
        self.addSubview(vBackground)
        self.addSubview(textField)
        self.addSubview(lbTitle)
        
        lbTitle.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        vBackground.anchor(lbTitle.bottomAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        textField.anchor(vBackground.topAnchor, left: vBackground.leftAnchor, bottom: vBackground.bottomAnchor, right: vBackground.rightAnchor, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        
    }
    func setTitleTextField(text: String) {
        lbTitle.text = text
    }
}
