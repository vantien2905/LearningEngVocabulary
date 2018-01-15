//
//  LEVPercentView.swift
//  LearningEnglish
//
//  Created by Kai Pham on 1/10/18.
//  Copyright © 2018 Tien Dinh. All rights reserved.
//

import UIKit

class LEVPercentView: LEVBaseView {
    private var colorCompleted: UIColor     = LEVColor.buttonGreen
    private var percentCompleted: CGFloat   = 50 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    func setPercent(percent: CGFloat) {
        self.percentCompleted = percent
    }
    
    //---
    override func setUpViews() {
        self.setBorder(cornerRadius: 5)
    }
    
    override func draw(_ rect: CGRect) {
        let newRect         = CGRect(x: rect.minX, y: rect.minY, width: rect.width, height: rect.height )
        let pathBackground  = UIBezierPath(rect: newRect)
        LEVColor.grayColor.setFill()
        pathBackground.fill()
        
        let width           = percentCompleted * newRect.width / 100
        let frameCompleted  = CGRect(x: newRect.minX, y: newRect.minY, width: width, height: newRect.height)
        let pathComplted    = UIBezierPath(rect: frameCompleted)
        colorCompleted.setFill()
        pathComplted.fill()
        
    }
}
