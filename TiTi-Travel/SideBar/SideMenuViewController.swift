//
//  SideMenuViewController.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 25/3/2564 BE.
//

import UIKit

class SideMenuViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var logoutLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    func commonInit() {
        helloLabel.setFontAndColor(with: UIFont.app.bold15, and: UIColor.app.green)
        logoutLabel.setFontAndColor(with: UIFont.app.bold15, and: UIColor.app.green)
        firstNameLabel.setFontAndColor(with: UIFont.app.semibold13, and: UIColor.app.green)
        lastNameLabel.setFontAndColor(with: UIFont.app.semibold13, and: UIColor.app.green)
        ageLabel.setFontAndColor(with: UIFont.app.semibold13, and: UIColor.app.green)
    }
    
    func configure(with: SideMenuViewModel) {
        
    }
}
