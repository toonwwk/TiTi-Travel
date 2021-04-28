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
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var logoutLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    func commonInit() {
        helloLabel.setFontAndColor(with: UIFont.app.bold15, and: UIColor.app.white)
        logoutLabel.setFontAndColor(with: UIFont.app.bold15, and: UIColor.app.green)
        lastNameLabel.setFontAndColor(with: UIFont.app.semibold13, and: UIColor.app.green)
        nameLabel.setFontAndColor(with: UIFont.app.semibold13, and: UIColor.app.green)
        ageLabel.setFontAndColor(with: UIFont.app.semibold13, and: UIColor.app.green)
        helloLabel.text = "Hi, " + Mock.name
        ageLabel.text = Mock.age
        nameLabel.text = Mock.name
        lastNameLabel.text = Mock.lastName
        imageView.image = Mock.image
        backgroundView.backgroundColor = UIColor.app.green
    }
    
    func configure(with: SideMenuViewModel) {
        
    }
}
