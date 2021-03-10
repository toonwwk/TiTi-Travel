//
//  RoundButton.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 16/2/2564 BE.
//

import UIKit

class RoundButton: UIButton {
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func didMoveToSuperview() {
        commonInit()
    }
    
    func commonInit() {
        self.layer.cornerRadius = self.frame.height/2
        self.titleLabel?.font = UIFont.app.bold15
    }
    
}
