//
//  AppColor.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 15/2/2564 BE.
//

import UIKit

// MARK:- Font
extension UIFont {
    
    public struct app {
        public static var regular10: UIFont {
            return UIFont(name: R.font.openSans.fontName, size: 10)!
        }
        
        public static var regular15: UIFont {
            return UIFont(name: R.font.openSans.fontName, size: 15)!
        }
        
        public static var bold15: UIFont {
            return UIFont(name: R.font.openSansBold.fontName, size: 15)!
        }
        
        public static var semibold15: UIFont {
            return UIFont(name: R.font.openSansSemibold.fontName, size: 15)!
        }
        
        public static var regular13: UIFont {
            return UIFont(name: R.font.openSans.fontName, size: 13)!
        }
        
        public static var regular12: UIFont {
            return UIFont(name: R.font.openSans.fontName, size: 12)!
        }
        
        public static var bold18: UIFont {
            return UIFont(name: R.font.openSansBold.fontName, size: 18)!
        }
    }
    
}

// MARK:- Color
extension UIColor {
    
    public struct app {
        public static var green: UIColor {
            return UIColor(red: 80/255, green: 163/255, blue: 164/255, alpha: 1)
        }
        
        public static var brown: UIColor {
            return UIColor(red: 103/255, green: 74/255, blue: 65/255, alpha: 1)
        }
        
        public static var gray229: UIColor {
            return UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1)
        }
        
        public static var gray205: UIColor {
            return UIColor(red: 205/255, green: 205/255, blue: 205/255, alpha: 1)
        }
        
        public static var gray192: UIColor {
            return UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
        }
        
        public static var orange: UIColor {
            return UIColor(red: 249/255, green: 83/255, blue: 53/255, alpha: 1)
        }
        
        public static var white: UIColor {
            return UIColor.white
        }
        
        public static var clear: UIColor {
            return UIColor.clear
        }
    }
    
}

// MARK:- View
extension UIView {
    
    func replace(by subview: UIView) {
        addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[subview]-0-|", options: [], metrics: nil, views: ["subview": subview]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[subview]-0-|", options: [], metrics: nil, views: ["subview": subview]))
    }
    
}

// MARK:- Tetxtfield
extension UITextField {
    func datePicker<T>(target: T,
                       doneAction: Selector,
                       cancelAction: Selector,
                       datePickerMode: UIDatePicker.Mode = .date) {
        let screenWidth = UIScreen.main.bounds.width
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: target, action: cancelAction)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: target, action: doneAction)
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 44))
        
        doneButton.tintColor = UIColor.app.green
        cancelButton.tintColor = UIColor.app.green
        datePicker.datePickerMode = datePickerMode
        toolBar.setItems([cancelButton, flexibleSpace, doneButton],animated: true)
        inputView = datePicker
        inputAccessoryView = toolBar

        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
    }
}

//MARK:- UIButton
extension UIButton {
    func moveImageLeftTextCenter(imagePadding: CGFloat = 30.0){
        guard let imageViewWidth = self.imageView?.frame.width else{return}
        guard let titleLabelWidth = self.titleLabel?.intrinsicContentSize.width else{return}
        self.contentHorizontalAlignment = .left
        imageEdgeInsets = UIEdgeInsets(top: 0.0, left: imagePadding - imageViewWidth / 2, bottom: 0.0, right: 0.0)
        titleEdgeInsets = UIEdgeInsets(top: 0.0, left: (bounds.width - titleLabelWidth) / 2 - imageViewWidth, bottom: 0.0, right: 0.0)
    }
}
