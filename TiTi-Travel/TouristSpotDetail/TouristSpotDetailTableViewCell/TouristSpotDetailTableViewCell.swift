//
//  TouristSpotDetailTableViewCell.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 21/4/2564 BE.
//

import UIKit
import Kingfisher

class TouristSpotDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }

    func commonInit() {
        descriptionLabel.setFontAndColor(with: UIFont.app.semibold15, and: UIColor.app.brown)
        iconImageView.contentMode = .scaleAspectFill
        iconImageView.tintColor = UIColor.app.brown
    }
    
    func configure(with image: UIImage, and text: String) {
        iconImageView.image = image
        descriptionLabel.text = text
    }
    
}
