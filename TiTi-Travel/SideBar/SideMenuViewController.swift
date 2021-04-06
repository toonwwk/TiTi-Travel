//
//  SideMenuViewController.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 25/3/2564 BE.
//

import UIKit

class SideMenuViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var helloLabel: bold15Label!
    @IBOutlet weak var firstNameLabel: semiBold13Label!
    @IBOutlet weak var lastNameLabel: semiBold13Label!
    @IBOutlet weak var ageLabel: semiBold13Label!
    @IBOutlet weak var logoutLabel: bold15Label!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func configure(with: SideMenuViewModel) {
        
    }
}
