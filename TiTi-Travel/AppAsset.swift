//
//  AppColor.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 15/2/2564 BE.
//

import Foundation
import UIKit

class AppAsset {
    
    static func green() -> UIColor { return UIColor(red: 80/255, green: 163/255, blue: 164/255, alpha: 1) }
    static func white() -> UIColor { return UIColor.white }
    static func brown() -> UIColor { return UIColor(red: 103/255, green: 74/255, blue: 65/255, alpha: 1) }
    static func clear() -> UIColor { return UIColor.clear }
    static func lightGray() -> UIColor { return UIColor(red: 205/255, green: 205/255, blue: 205/255, alpha: 1) }

    
    static func iconApp() -> UIImage { return UIImage(named: "icon-app")! }
    static func iconUsername() -> UIImage { return UIImage(named: "icon-username")! }
    static func iconPassword() -> UIImage { return UIImage(named: "icon-password")! }
    
    static func fontRegular15() -> UIFont { return UIFont(name: "OpenSans", size: 15)! }
    static func fontBold15() -> UIFont { return UIFont(name: "OpenSans-Bold", size: 15)! }
    static func fontSemibold15() -> UIFont { return UIFont(name: "OpenSans-Semibold", size: 15)! }
    
    static func fontRegular13() -> UIFont { return UIFont(name: "OpenSans", size: 13)! }

}
