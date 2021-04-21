//
//  TouristSpotDetailTableViewCell.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 21/4/2564 BE.
//

import UIKit
import Kingfisher

enum TouristSpotDetailTableViewCellType {
    case title
    case description
    case price
    case priceRange
}

class TouristSpotDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }

    func commonInit() {
        descriptionLabel.setFontAndColor(with: UIFont.app.regular15, and: UIColor.app.green)
        iconImageView.contentMode = .scaleAspectFill
    }
    
    func configure(with image: UIImage, and text: String) {
        iconImageView.image = image
        descriptionLabel.text = text
    }
    
}
