//
//  LineView.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 19/2/2564 BE.
//

import UIKit

class LineView: UIView {
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func didMoveToSuperview() {
        commonInit()
    }
    
    func commonInit() {
        self.backgroundColor = UIColor.app.gray205
    }
    
}
