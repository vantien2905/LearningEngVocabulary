//
//  UIViewController+Extension.swift
//  LearningEnglish
//
//  Created by Tien Dinh on 11/5/17.
//  Copyright © 2017 Tien Dinh. All rights reserved.
//

import UIKit
public extension UIViewController {
   
    class func initControllerFromNib() -> UIViewController {
        let isNib: Bool = Bundle.main.path(forResource: self.className, ofType: "nib") != nil
        guard isNib else {
            assert(!isNib, "invalid nib file")
            return UIViewController()
        }
        return self.init(nibName: self.className, bundle: nil)
    }
}

extension UIViewController {
    func push(controller: UIViewController, animated: Bool = true) {
        self.navigationController?.pushViewController(controller, animated: animated)
    }
    
    func present(controller: UIViewController, animated: Bool = true) {
        self.present(controller, animated: animated, completion: nil)
    }
    
    func pop(animated: Bool = true ) {
        self.navigationController?.popViewController(animated: animated)
    }
    
}
