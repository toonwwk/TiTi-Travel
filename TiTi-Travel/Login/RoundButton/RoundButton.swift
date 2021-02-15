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
        configureView()
    }
    
    func configureView() {
        self.layer.cornerRadius = self.frame.height/2
        self.titleLabel?.font = AppAsset.fontBold15()
    }
    
}
