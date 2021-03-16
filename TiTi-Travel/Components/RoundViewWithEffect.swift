//
//  RoundView.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 19/2/2564 BE.
//

import UIKit

class RoundViewWithEffect: UIView {
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        commonInit()
    }
    
    func commonInit() {
        self.backgroundColor = UIColor.app.white
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.app.gray205.cgColor
        self.layer.cornerRadius = self.frame.height/2
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 40).cgPath
        self.layer.shadowOpacity = 0.25
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
        
}

