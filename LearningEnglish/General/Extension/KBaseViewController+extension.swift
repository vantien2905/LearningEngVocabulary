//
//  KBaseViewController+extension.swift
//  LearningEnglish
//
//  Created by Tu DV on 1/11/18.
//  Copyright © 2018 Tien Dinh. All rights reserved.
//

import UIKit

extension KBaseViewController {
    
    func showError(message: String) {
        /// alert
        // title = error
        // content
        // button OK
        let alert = UIAlertController(title: LEVErrorTitle.error, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: LEVMessageTitle.ok, style: .destructive, handler: nil))
        self.present(controller: alert)
        
    }
}
