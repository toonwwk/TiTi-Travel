//
//  RoundButton.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 16/2/2564 BE.
//

import UIKit

class BorderView: UIView {
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        commonInit()
    }
    
    func commonInit() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.app.white.cgColor
        self.layer.backgroundColor = UIColor.app.clear.cgColor
    }
    
}

class LineView: UIView {
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        commonInit()
    }
    
    func commonInit() {
        self.backgroundColor = UIColor.app.gray205
    }
    
}

class GreenLineView: UIView {
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        commonInit()
    }
    
    func commonInit() {
        self.backgroundColor = UIColor.app.green
    }
    
}

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

class RoundImageView: UIImageView {
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        commonInit()
    }
    
    func commonInit() {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
    
}

class semiBold13Label: UILabel {
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        commonInit()
    }
    
    func commonInit() {
        self.font = UIFont.app.semibold13
        self.textColor = UIColor.app.green
    }
}

class bold15Label: UILabel {
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        commonInit()
    }
    
    func commonInit() {
        self.font = UIFont.app.bold15
        self.textColor = UIColor.app.green
    }
}
