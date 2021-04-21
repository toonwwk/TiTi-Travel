//
//  CollectionReusableView.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 16/4/2564 BE.
//

import UIKit

class CollectionReusableView: UICollectionReusableView {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var headerBackground: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    func commonInit() {
        headerLabel.font = UIFont.app.bold15
        headerLabel.textColor = UIColor.app.brown
    }
    
    func configure(with text: String) {
        headerLabel.text = text
    }
    
}
