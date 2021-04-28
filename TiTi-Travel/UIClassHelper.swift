//
//  RoundButton.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 16/2/2564 BE.
//

import UIKit

//MARK:- While border view
class BorderView: UIView {
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.app.white.cgColor
        self.layer.backgroundColor = UIColor.app.clear.cgColor
    }
    
}

//MARK:- Separated gray line view
class LineView: UIView {
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.backgroundColor = UIColor.app.gray229
    }
    
}

//MARK:- Separated green line view
class GreenLineView: UIView {
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.backgroundColor = UIColor.app.green
    }
    
}

//MARK:- View with shadow
class RoundViewWithEffect: UIView {
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
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

//MARK:- Round button
class RoundButton: UIButton {
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.layer.cornerRadius = self.frame.height/2
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 40).cgPath
        self.layer.shadowOpacity = 0.25
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
    }
    
}

//MARK:- Round image view
class RoundImageView: UIImageView {
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
    
}

//MARK:- Label regular
class Regular13BrownLabel: UILabel {
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.font = UIFont.app.regular13
        self.textColor = UIColor.app.brown
    }
    
}

class Regular15BrownLabel: UILabel {
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.font = UIFont.app.regular15
        self.textColor = UIColor.app.brown
    }
    
}

class Regular15GreenLabel: UILabel {
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.font = UIFont.app.regular15
        self.textColor = UIColor.app.green
    }
    
}

class Regular15WhiteLabel: UILabel {
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.font = UIFont.app.regular15
        self.textColor = UIColor.app.white
    }
    
}

class Regular15GrayLabel: UILabel {
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.font = UIFont.app.regular15
        self.textColor = UIColor.app.gray229
    }
    
}




//MARK:- Label semibold
class SemiBold15BrownLabel: UILabel {
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.font = UIFont.app.semibold15
        self.textColor = UIColor.app.brown
    }
    
}


class SemiBold13GreenLabel: UILabel {
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.font = UIFont.app.semibold13
        self.textColor = UIColor.app.green
    }
    
}

class SemiBold10GreenLabel: UILabel {
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.font = UIFont.app.semibold10
        self.textColor = UIColor.app.green
    }
    
}

//MARK:- Label bold
class Bold18GreenLabel: UILabel {
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.font = UIFont.app.bold18
        self.textColor = UIColor.app.green
    }
    
}

class Bold15GreenLabel: UILabel {
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.font = UIFont.app.bold15
        self.textColor = UIColor.app.green
    }
    
}

class Bold15BrownLabel: UILabel {
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.font = UIFont.app.bold15
        self.textColor = UIColor.app.brown
    }
    
}

class Bold15WhiteLabel: UILabel {
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.font = UIFont.app.bold15
        self.textColor = UIColor.app.white
    }
    
}


//MARK:- Auth Textfield
class LoginTextField: UITextField {
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.borderStyle = .none
        self.tintColor = UIColor.app.gray205
        self.font = UIFont.app.regular15
        self.textColor = UIColor.app.white
    }
    
}


class RegisterTextField: UITextField {
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.borderStyle = .none
        self.tintColor = UIColor.app.gray205
        self.font = UIFont.app.regular15
        self.textColor = UIColor.app.green
    }
    
}
