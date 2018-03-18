//
//  UnitTableViewCell.swift
//  LearningEnglish
//
//  Created by Tien Dinh on 12/3/17.
//  Copyright © 2017 Tien Dinh. All rights reserved.
//

import UIKit
import SDWebImage
import AVFoundation

class UnitTableViewCell: LEVBaseTableCellXib {
    
    @IBOutlet weak var imgWord: UIImageView!
    @IBOutlet weak var lbWord: LEVLabel!
    @IBOutlet weak var lbVnRaw: LEVLabel!
    @IBOutlet weak var lbVietnameseWord: LEVLabel!
    @IBOutlet weak var lbExample: LEVLabel!
    
    var player: AVAudioPlayer?
    
    @IBAction func btnSpeakerTapped() {
        playSound()
    }
    
    var isTranslate = true
    var vocabulary: Vocabulary? {
        didSet {
            setData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setData() {
        lbVietnameseWord.isHidden = !isTranslate
        guard let _vocabulary = vocabulary else {return}
        lbWord.text = _vocabulary.english
        lbVnRaw.text = _vocabulary.vnRaw
        lbVietnameseWord.text = _vocabulary.vietnamese
        lbExample.text = _vocabulary.example
        guard let _thumbUrl = _vocabulary.thumbUrl else {return}
        let url = URL(string: _thumbUrl)
        imgWord.sd_setImage(with: url, placeholderImage: LEVImage.imgSetting)
        lbWord.textColor = LEVColor.titleGreen
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "cungAnh", withExtension: "mp3") else { return }
        
//        guard let url = URL(string: "https://mp3.zing.vn/bai-hat/Nguoi-La-Oi-Karik-Orange-Superbrothers/ZW9A8ACC.html") else {return}

        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
}

class LEVLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    func setUpView() {
        self.textColor = LEVColor.blackColor
    }
    
    func setContent(title: String, colorText: UIColor = LEVColor.blackColor,  font: UIFont = LEVFont.fontRegular15) {
        self.text = title
        self.font = font
        self.textColor = colorText
    }
    
}
