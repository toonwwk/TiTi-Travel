//
//  BorderView.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 14/2/2564 BE.
//

import UIKit

class BorderView: UIView {
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func didMoveToSuperview() {
        commonInit()
    }
    
    func commonInit() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.app.white.cgColor
        self.layer.backgroundColor = UIColor.app.clear.cgColor
    }
    
}
