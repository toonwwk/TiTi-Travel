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
            return UIFont(name: "OpenSans", size: 10)!
        }
        
        public static var regular15: UIFont {
            return UIFont(name: "OpenSans", size: 15)!
        }
        
        public static var bold15: UIFont {
            return UIFont(name: "OpenSans-Bold", size: 15)!
        }
        
        public static var semibold15: UIFont {
            return UIFont(name: "OpenSans-Semibold", size: 15)!
        }
        
        public static var semibold13: UIFont {
            return UIFont(name: "OpenSans-Semibold", size: 13)!
        }
        
        public static var semibold10: UIFont {
            return UIFont(name: "OpenSans-Semibold", size: 10)!
        }
        
        public static var regular13: UIFont {
            return UIFont(name: "OpenSans-Semibold", size: 13)!
        }
        
        public static var regular12: UIFont {
            return UIFont(name: "OpenSans-Semibold", size: 12)!
        }
        
        public static var bold18: UIFont {
            return UIFont(name: "OpenSans-Bold", size: 18)!
        }
    }
    
}

// MARK:- Asset
extension UIImage {
    public struct app {
        public static var pin: UIImage {
            return UIImage(named: "icon-pin")!
        }
        
        public static var appLogo: UIImage {
            return UIImage(named: "icon-app")!
        }
        
        public static var error: UIImage {
            return UIImage(named: "icon-error")!
        }
        
        public static var filter: UIImage {
            return UIImage(named: "icon-filter")!
        }
        
        public static var centerLocation: UIImage {
            return UIImage(named: "icon-center-location")!
        }
        
        public static var navLogo: UIImage {
            return UIImage(named: "icon-nav-bar-logo")!
        }
        
        public static var username: UIImage {
            return UIImage(named: "icon-username")!
        }
        
        public static var password: UIImage {
            return UIImage(named: "icon-password")!
        }
        
        public static var userImage: UIImage {
            return UIImage(named: "icon-user-image")!
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

// MARK:- UIView
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
        datePicker.set5YearValidation()
        toolBar.setItems([cancelButton, flexibleSpace, doneButton],animated: true)
        inputView = datePicker
        inputAccessoryView = toolBar

        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
    }
    
    func setPlaceHolder(with text: String) {
        self.attributedPlaceholder = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor: UIColor.app.gray229])
    }
    
}

//MARK:- UIDatePicker
extension UIDatePicker {
    
    func set5YearValidation() {
        let currentDate: Date = Date()
        var calendar: Calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        calendar.timeZone = TimeZone(identifier: "UTC")!
        var components: DateComponents = DateComponents()
        components.calendar = calendar
        components.year = -5
        let maxDate: Date = calendar.date(byAdding: components, to: currentDate)!
        components.year = -120
        let minDate: Date = calendar.date(byAdding: components, to: currentDate)!
        self.minimumDate = minDate
        self.maximumDate = maxDate
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

//MARK:- String
extension String {
    
    func titlecased() -> String {
        return self.replacingOccurrences(of: "([A-Z])", with: " $1", options: .regularExpression, range: self.range(of: self))
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .capitalized
    }
    
    func validate(with regEx: String) -> Bool {
        let stringChecker = NSPredicate(format:"SELF MATCHES[c] %@", regEx)
        return stringChecker.evaluate(with: self)
    }
    
    func hasSpecialCharacter() -> Bool {
        return validate(with: ".*[^A-Za-z0-9-_].*")
    }
    
    func hasOnlyAlphabet() -> Bool {
        return validate(with: ".*[^A-Za-z].*")
    }
    
    func hasWhiteSpace() -> Bool {
        return validate(with: ".*[\\s].*")
    }
    
}

extension UILabel {
    
    func setFontAndColor(with font: UIFont, and color: UIColor) {
        self.font = font
        self.textColor = color
    }
    
}

extension UIButton{
    
    func setFontAndColor(with font: UIFont, and color: UIColor) {
        self.titleLabel?.font = font
        self.setTitleColor(color, for: .normal)
    }
    
    func setUnderlinedText(with text: String) {
        self.titleLabel?.attributedText = NSAttributedString(string: text, attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        self.setTitle(text, for: .normal)
    }
    
}
