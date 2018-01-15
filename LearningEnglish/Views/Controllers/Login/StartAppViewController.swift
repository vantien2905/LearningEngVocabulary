//
//  StartAppViewController.swift
//  LearningEnglish
//
//  Created by Tien Dinh on 10/25/17.
//  Copyright © 2017 Tien Dinh. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Crashlytics

class StartAppViewController: LEVBaseViewController {
    @IBAction func btnLogIn() {
        let vc = LogInViewController.initFromNib()
        self.push(controller: vc)
        
    }
    
    @IBAction func btnSignUp() {
        let vc = SignUpViewController.initFromNib()
        self.push(controller: vc)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //--- test crash app
//        let button = UIButton(type: .roundedRect)
//        button.frame = CGRect(x: 20, y: 50, width: 100, height: 30)
//        button.setTitle("Crash", for: [])
//        button.addTarget(self, action: #selector(self.crashButtonTapped(_:)), for: .touchUpInside)
//        view.addSubview(button)

    }
    
//    @IBAction func crashButtonTapped(_ sender: AnyObject) {
//        Crashlytics.sharedInstance().crash()
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
}
