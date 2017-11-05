//
//  BaseViewController.swift
//  LearningEnglish
//
//  Created by Tien Dinh on 10/25/17.
//  Copyright © 2017 Tien Dinh. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = LEVColor.whiteColor
        setupNavigation()
        setUpView()
        // Do any additional setup after loading the view.
    }
    func setUpView() {}
    
    func setupNavigation(){
        self.navigationController?.navigationBar.barTintColor = LEVColor.naviBarColor
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func addButtonToNavigation(image: UIImage, style: StyleNavigation, action: Selector?) {
        let btn = UIButton()
        btn.setImage(image, for: .normal)
        if let _action = action {
            btn.addTarget(self, action: _action, for: .touchUpInside)
        }
        
        btn.frame = CGRect(x: 0, y: 0, width: 60, height: 44)
        btn.contentHorizontalAlignment = .left
        let button = UIBarButtonItem(customView: btn)
        if style == .left {
            self.navigationItem.leftBarButtonItem = button
        } else {
            self.navigationItem.rightBarButtonItem = button
        }
    }
    
    func addTwoButtonToNavigation(image1: UIImage, action1: Selector?, image2: UIImage, action2: Selector?) {
        let btn1 = UIButton()
        btn1.setImage(image1, for: .normal)
        if let _action = action1 {
            btn1.addTarget(self, action: _action, for: .touchUpInside)
        }
        
        btn1.sizeToFit()
        let button1 = UIBarButtonItem(customView: btn1)
        
        //---
        let btn2 = UIButton()
        btn2.setImage(image2, for: .normal)
        if let _action = action2 {
            btn2.addTarget(self, action: _action, for: .touchUpInside)
        }
        btn2.frame = CGRect(x: 0, y: 0, width: 60, height: 44)
        let button2 = UIBarButtonItem(customView: btn2)
        
        self.navigationItem.rightBarButtonItems = [button1, button2]
    }
    
//    func addButtonTextToNavigation(title: String, style: StyleNavigation, action: Selector?) {
//        let btn = UIButton()
//        btn.setAttributed(title: title, color: UIColor.white, font: )
//        if let _action = action {
//            btn.addTarget(self, action: _action, for: .touchUpInside)
//        }
//        btn.sizeToFit()
//
//        let button = UIBarButtonItem(customView: btn)
//        if style == .left {
//
//            self.navigationItem.leftBarButtonItem = button
//        } else {
//            self.navigationItem.rightBarButtonItem = button
//        }
//    }
    
    func setTitle(title: String) {
        let lb = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44))
        lb.font = LEVFont.fontMedium17
        lb.text = title
        lb.textAlignment = .center
        lb.numberOfLines = 2
        lb.textColor = LEVColor.whiteColor
        lb.sizeToFit()
        
        self.navigationItem.titleView = lb
    }
//
//    func addDrawerButton() {
//        self.addButtonToNavigation(image: NCSImage.imgDrawer, style: .left, action: #selector(btnDrawerTapped))
//    }
//
//    func addBackButton() {
//        self.addButtonToNavigation(image: NCSImage.imgBackBlack, style: .left, action: #selector(btnBackTapped))
//    }
//
//    @objc func btnDrawerTapped() {
//        Utils.logout()
//    }
//
    @objc func btnBackTapped() {
        self.navigationController?.popViewController(animated: true)
    }

}
