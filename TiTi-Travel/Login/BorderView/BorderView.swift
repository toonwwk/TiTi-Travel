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
        configureView()
    }
    
    func configureView() {
        self.layer.borderWidth = 1
        self.layer.borderColor = AppAsset.white().cgColor
        self.layer.backgroundColor = AppAsset.clear().cgColor
    }
    
}
