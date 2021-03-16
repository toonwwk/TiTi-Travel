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
        super.didMoveToSuperview()
        commonInit()
    }
    
    func commonInit() {
        self.layer.cornerRadius = self.frame.height/2
        self.titleLabel?.font = UIFont.app.bold15
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 40).cgPath
        self.layer.shadowOpacity = 0.25
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
    }
    
}
