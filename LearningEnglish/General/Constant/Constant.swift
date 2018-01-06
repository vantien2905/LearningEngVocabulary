//
//  Constant.swift
//  LearningEnglish
//
//  Created by Tien Dinh on 10/25/17.
//  Copyright © 2017 Tien Dinh. All rights reserved.
//

import Foundation
import UIKit
struct LEVColor {
    static let whiteColor = UIColor.white
    static let blackColor = UIColor.black
    static let naviBarColor =  UIColor(red: 0.11, green: 0.58, blue: 0.45, alpha: 1)
    static let blueColor = UIColor(red: 0.22, green: 0.71, blue: 0.29, alpha: 1)
    static let grayColor = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 1)
    static let lineColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1)
    static let background = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
    
    static let buttonGreen = UIColor.hexStringToUIColor(hex: "39b54a")
    static let titleGreen = UIColor.hexStringToUIColor(hex: "1d9571")
    
    
//    struct  ColorGlobal {
//        static let titleGreen = UIColor(hex: "1d9571")
//        static let buttonGreen =  UIColor(hex: "39b54a")
//        static let backGround =  UIColor(hex: "f9f9f9")
//        static let foreGround =  UIColor(hex: "ffffff")
//        static let paragraphText =  UIColor(hex: "000000")
//        static let smallTitle =  UIColor(hex: "6e6e6e")
//        static let background241 =  UIColor(hex: "f1f1f1")
//        static let backgroundGray = UIColor.blackColor().colorWithAlphaComponent(0.1)
//        static let notificationRead = UIColor(hex: "f1f1f1")
//        static let buttonGray = UIColor(hex: "b8b8b8")
//    }
}

struct LEVFont {
    
    static let fontRegular11 = UIFont.monospacedDigitSystemFont(ofSize: 11, weight: .regular)
    static let fontRegular13 = UIFont.monospacedDigitSystemFont(ofSize: 12.5, weight: .regular)
    static let fontRegular15 = UIFont.monospacedDigitSystemFont(ofSize: 15, weight: .regular)
    static let fontRegular17 = UIFont.monospacedDigitSystemFont(ofSize: 17.5, weight: .regular)
    
    static let fontMedium7 = UIFont.monospacedDigitSystemFont(ofSize: 7.5, weight: .medium)
    static let fontMedium13 = UIFont.monospacedDigitSystemFont(ofSize: 12.5, weight: .medium)
//    static let fontMedium11 = ScreenSize.SCREEN_MAX_LENGTH <= 568 ?  UIFont.monospacedDigitSystemFont(ofSize: 9, weight: .medium) :  UIFont.monospacedDigitSystemFont(ofSize: 11, weight: .medium)
    static let fontMedium15 = UIFont.monospacedDigitSystemFont(ofSize: 15, weight: .medium)
    static let fontMedium17 = UIFont.monospacedDigitSystemFont(ofSize: 17.5, weight: .medium)
    
    static let fontLight13 = UIFont.monospacedDigitSystemFont(ofSize: 12.5, weight: .light)
    static let fontLight15 = UIFont.monospacedDigitSystemFont(ofSize: 15, weight: .light)
    static let fontLight17 = UIFont.monospacedDigitSystemFont(ofSize: 17.5, weight: .light)
    
    static let fontBold13 = UIFont.monospacedDigitSystemFont(ofSize: 12.5, weight: .bold)
    static let fontBold15 = UIFont.monospacedDigitSystemFont(ofSize: 15, weight: .bold)
    static let fontBold17 = UIFont.monospacedDigitSystemFont(ofSize: 17.5, weight: .bold)
}

struct LEVImage {
    static let imgBookTabbar = UIImage(named: "feeds")!.withRenderingMode(.alwaysOriginal)
    static let imgBookTabbarActive = UIImage(named: "feeds_active")!.withRenderingMode(.alwaysOriginal)
    static let imgSetting = UIImage(named: "settings")!.withRenderingMode(.alwaysOriginal)
    static let imgSettingActive = UIImage(named: "settings_active")!.withRenderingMode(.alwaysOriginal)
    static let imgUserTabbar = UIImage(named: "profile")!.withRenderingMode(.alwaysOriginal)
    static let imgUserTabbarActive = UIImage(named: "profile_active")!.withRenderingMode(.alwaysOriginal)
}
