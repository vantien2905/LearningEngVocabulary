//
//  TabbarMainViewController.swift
//  LearningEnglish
//
//  Created by Kai Pham on 1/6/18.
//  Copyright © 2018 Tien Dinh. All rights reserved.
//

import UIKit

class TabbarMainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabbar()
//        configureTabbar()
    }
    
    func setUpTabbar() {
        let vcWordBook = WordBookViewController.initFromNib()
        let vcManagerUser = UserManagerViewController.initFromNib()
        let vcSetting = SettingsViewController.initFromNib()
        //---
        vcWordBook.tabBarItem     = setBarItem(selectedImage: LEVImage.imgBookTabbarActive, normalImage: LEVImage.imgBookTabbar)
        
        vcManagerUser.tabBarItem = setBarItem(selectedImage: LEVImage.imgUserTabbarActive, normalImage: LEVImage.imgUserTabbar)
        
        vcSetting.tabBarItem = setBarItem(selectedImage: LEVImage.imgSettingActive, normalImage: LEVImage.imgSetting)
        
        let listViewController = [vcWordBook, vcManagerUser, vcSetting]
        
        addViewControllerToTabbar(listViewController: listViewController)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        configureTabbar()
    }
    
    func configureTabbar() {
        var newFrame = tabBar.frame
        newFrame.size.height += 13
        newFrame.origin.y -= 13
        tabBar.frame = newFrame
    }
    
    func addViewControllerToTabbar(listViewController: [UIViewController]) {
        var listNavigationController = [UINavigationController]()
        for vc in listViewController {
            let nc = UINavigationController(rootViewController: vc)
            listNavigationController.append(nc)
        }
        
        //---
        self.viewControllers = listNavigationController
    }
    
    func setBarItem(selectedImage: UIImage?, normalImage: UIImage?) -> UITabBarItem {
        let item = UITabBarItem(title: nil, image: normalImage, selectedImage: selectedImage)
        return item
    }
}
