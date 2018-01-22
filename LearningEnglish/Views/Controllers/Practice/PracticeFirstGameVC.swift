//
//  PracticeFirstGame.swift
//  LearningEnglish
//
//  Created by Tu DV on 1/22/18.
//  Copyright © 2018 Tien Dinh. All rights reserved.
//

import UIKit

class PracticeFirstGameVC: LEVBaseViewController {
    
    @IBOutlet weak var lbChooseWord: UILabel!
    @IBOutlet weak var imgWord: UIImageView!
    @IBOutlet weak var btnSpeak: UIButton!
    @IBOutlet weak var imgSpeak: UIImageView!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var tbvWordChoose: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setUpViews() {
        
        btnSubmit.setAttributed(title: "Submit", color: LEVColor.whiteColor, font: LEVFont.fontBold15)
        btnSubmit.setBorder(borderWidth: 1, borderColor: LEVColor.titleGreen, cornerRadius: 5)
        btnSubmit.backgroundColor = LEVColor.titleGreen
        configureTable()
    }
//    static func configureController() -> PracticeFirstGameVC {
//        let vc = PracticeFirstGameVC.initFromNib()
//        return
//    }
}
// MARK: Handle table view
extension PracticeFirstGameVC: UITableViewDataSource, UITableViewDelegate {
    
    func configureTable() {
        tbvWordChoose.registerCustomCell(PracticeGameCell.self, fromNib: true)
        tbvWordChoose.registerCustomCell(PracticeGameCell.self, fromNib: true)
        tbvWordChoose.separatorStyle = .none
        tbvWordChoose.dataSource = self
        tbvWordChoose.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCustomCell(PracticeGameCell.self)
        
        return cell
    }
    
}
