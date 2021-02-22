//
//  AppColor.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 15/2/2564 BE.
//

import UIKit

// MARK-: Font
extension UIFont {
    
    public struct app {
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
        
        public static var bold18: UIFont {
            return UIFont(name: R.font.openSansBold.fontName, size: 18)!
        }
    }
    
}

// MARK-: Color
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
        
        public static var white: UIColor {
            return UIColor.white
        }
        
        public static var clear: UIColor {
            return UIColor.clear
        }
    }
    
}
