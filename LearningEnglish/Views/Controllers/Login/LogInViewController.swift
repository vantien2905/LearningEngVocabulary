//
//  LogInViewController.swift
//  LearningEnglish
//
//  Created by Tien Dinh on 11/5/17.
//  Copyright © 2017 Tien Dinh. All rights reserved.
//

import UIKit

class LogInViewController: BaseViewController {
    @IBOutlet weak var tfUserName: LEVTextField!
    @IBOutlet weak var tfPassWord: LEVTextField!
    @IBOutlet weak var btEnter: UIButton!
    @IBAction func btnEnter() {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle(title: "LogIn")
        // Do any additional setup after loading the view.
    }
//    override func viewWillAppear(_ animated: Bool) {
//        self.navigationController?.isNavigationBarHidden = false
//    }
    
    override func setUpView() {
        tfUserName.setTitleTextField(text: "UserName")
        tfPassWord.setTitleTextField(text: "Password")
        tfPassWord.backgroundColor = LEVColor.whiteColor
        tfUserName.backgroundColor = LEVColor.whiteColor
        btEnter.layer.cornerRadius = 5
//        self.navigationItem.hidesBackButton = true
    }

}
