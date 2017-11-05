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

class StartAppViewController: BaseViewController {
    @IBAction func btnLogIn() {
        let vc = LogInViewController.initControllerFromNib()
        self.push(controller: vc)
        
    }
    
    @IBAction func btnSignUp() {
        let vc = SignUpViewController.initControllerFromNib()
        self.push(controller: vc)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    func setupView() {
        setTitle(title: "Login")
        
        print("Test")
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
}
