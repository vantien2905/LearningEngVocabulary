//
//  KBaseViewController.swift
//  CodeBaseNetWork
//
//  Created by Kai Pham on 12/28/17.
//  Copyright © 2017 Kai Pham. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Action

enum StyleNavigation {
    case left
    case right
}

class KBaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigation()
        setUpViews()
    }
    
    func setUpViews() {
        
    }
    
    func setUpNavigation() {
        //---
        self.navigationController?.navigationBar.barTintColor = LEVColor.naviBarColor
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.isHidden = false
        self.view.backgroundColor = LEVColor.background
        setGradientNavigation()
    }
    
    private func setGradientNavigation() {
        let gradient = CAGradientLayer()
        let sizeLength = UIScreen.main.bounds.size.height * 2
        let defaultNavigationBarFrame = CGRect(x: 0, y: 0, width: sizeLength, height: 64)
        
        gradient.frame = defaultNavigationBarFrame
        
        gradient.colors = [LEVColor.buttonGreen.cgColor, LEVColor.titleGreen.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 1)
        gradient.endPoint = CGPoint(x: 0.3, y: 0.9)
        
        UINavigationBar.appearance().setBackgroundImage(self.image(fromLayer: gradient), for: .default)
    }
    
    private func image(fromLayer layer: CALayer) -> UIImage {
        UIGraphicsBeginImageContext(layer.bounds.size)
        
        layer.render(in: UIGraphicsGetCurrentContext()!)
        
        let outputImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return outputImage!
    }
    
    // No use Cocoa Action
    func addButtonImageToNavigation(image: UIImage, style: StyleNavigation, action: Selector?) {
        let btn = UIButton()
        btn.setImage(image, for: .normal)
        if let _action = action {
            btn.addTarget(self, action: _action, for: .touchUpInside)
        }
        
        btn.frame = CGRect(x: 0, y: 0, width: 60, height: 44)
        
        let button = UIBarButtonItem(customView: btn)
        if style == .left {
            btn.contentHorizontalAlignment = .left
            self.navigationItem.leftBarButtonItem = button
        } else {
            self.navigationItem.rightBarButtonItem = button
            btn.contentHorizontalAlignment = .right
        }
    }
    
    func addTwoButtonImageToNavigation(image1: UIImage, action1: Selector?, image2: UIImage, action2: Selector?) {
        let btn1 = UIButton()
        btn1.setImage(image1, for: .normal)
        if let _action = action1 {
            btn1.addTarget(self, action: _action, for: .touchUpInside)
        }
        
        btn1.frame = CGRect(x: 0, y: 0, width: 30, height: 44)
        btn1.contentHorizontalAlignment = .right
        let button1 = UIBarButtonItem(customView: btn1)
        
        //---
        let btn2 = UIButton()
        btn2.setImage(image2, for: .normal)
        if let _action = action2 {
            btn2.addTarget(self, action: _action, for: .touchUpInside)
        }
        btn2.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        btn2.contentHorizontalAlignment = .right
        
        let button2 = UIBarButtonItem(customView: btn2)
        
        self.navigationItem.rightBarButtonItems = [button1, button2]
    }
    
    func addButtonTextToNavigation(title: String, style: StyleNavigation, action: Selector?, textColor: UIColor = LEVColor.whiteColor, font: UIFont = LEVFont.fontBold17) {
        let btn = UIButton()
        btn.setAttributed(title: title, color: textColor, font: font)
        if let _action = action {
            btn.addTarget(self, action: _action, for: .touchUpInside)
        }
        btn.sizeToFit()
        
        let button = UIBarButtonItem(customView: btn)
        if style == .left {
            self.navigationItem.leftBarButtonItem = button
        } else {
            self.navigationItem.rightBarButtonItem = button
        }
    }
    
    func setTitle(title: String, textColor: UIColor = UIColor.white, font: UIFont = LEVFont.fontBold17) {
        let lb = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44))
        lb.font = font
        lb.text = title
        lb.textAlignment = .center
        lb.numberOfLines = 2
        lb.textColor = textColor
        lb.sizeToFit()
        
        self.navigationItem.titleView = lb
    }
    
    // use Cocoa Action
    func addButtonTextToNavigation(title: String, style: StyleNavigation, action: CocoaAction?, textColor: UIColor = LEVColor.whiteColor, font: UIFont = LEVFont.fontBold17) {
        var btn = UIButton()
        btn.setAttributed(title: title, color: textColor, font: font)
        btn.rx.action = action
        btn.sizeToFit()
        
        let button = UIBarButtonItem(customView: btn)
        if style == .left {
            self.navigationItem.leftBarButtonItem = button
        } else {
            self.navigationItem.rightBarButtonItem = button
        }
    }
    
    func addButtonImageToNavigation(image: UIImage, style: StyleNavigation, action: CocoaAction?) {
        var btn = UIButton()
        btn.setImage(image, for: .normal)
        btn.rx.action = action
        
        btn.frame = CGRect(x: 0, y: 0, width: 60, height: 44)
        
        let button = UIBarButtonItem(customView: btn)
        if style == .left {
            btn.contentHorizontalAlignment = .left
            self.navigationItem.leftBarButtonItem = button
        } else {
            self.navigationItem.rightBarButtonItem = button
            btn.contentHorizontalAlignment = .right
        }
    }
}

extension KBaseViewController {
    func addBackToNavigation() {
        addButtonImageToNavigation(image: LEVImage.imgBack, style: .left, action: #selector(btnBackTapped))
    }
    
    @objc func btnBackTapped() {
        self.pop()
    }
}
