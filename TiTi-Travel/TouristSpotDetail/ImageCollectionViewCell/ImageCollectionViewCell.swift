//
//  CollectionViewCell.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 21/4/2564 BE.
//

import UIKit
import Kingfisher

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }

    func commonInit() {
        image.layer.cornerRadius = 20
        image.contentMode = .scaleAspectFill
    }
    
    func configure(with url: URL) {
        image.kf.setImage(with: url)
    }
    
}
