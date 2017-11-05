//
//  SignUpViewController.swift
//  LearningEnglish
//
//  Created by Tien Dinh on 11/5/17.
//  Copyright © 2017 Tien Dinh. All rights reserved.
//

import UIKit

class SignUpViewController: BaseViewController {
    @IBOutlet weak var tfEmail: LEVTextField!
    @IBOutlet weak var tfPassword: LEVTextField!
    @IBOutlet weak var tfRetypePassword: LEVTextField!
    @IBOutlet weak var  btnEnter: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func setUpView() {
        tfEmail.setTitleTextField(text: "Email")
        tfPassword.setTitleTextField(text: "Password")
        tfRetypePassword.setTitleTextField(text: "Retype Password")
        setTitle(title: "Sign UP")
        tfEmail.backgroundColor = LEVColor.whiteColor
        tfPassword.backgroundColor = LEVColor.whiteColor
        tfRetypePassword.backgroundColor = LEVColor.whiteColor
        btnEnter.layer.cornerRadius = 5
    }
}
