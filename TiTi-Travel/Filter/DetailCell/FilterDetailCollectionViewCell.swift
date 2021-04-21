//
//  FilterDetailCollectionViewCell.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 16/4/2564 BE.
//

import UIKit

class FilterDetailCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var detailBackground: UIView!
    
    private var selectedState = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    func commonInit() {
        detailBackground.layer.borderWidth = 1
        detailBackground.layer.borderColor = UIColor.app.gray192.cgColor
        detailBackground.layer.backgroundColor = UIColor.app.white.cgColor
        detailBackground.layer.cornerRadius = 5
        detailLabel.font = UIFont.app.regular12
        detailLabel.textColor = UIColor.app.gray192
    }

    func configure(with text: String) {
        detailLabel.text = text
    }
    
    func toggleState() {
        selectedState = !selectedState
        detailBackground.layer.borderColor = selectedState ? UIColor.app.brown.cgColor : UIColor.app.gray192.cgColor
        detailLabel.textColor = selectedState ? UIColor.app.brown : UIColor.app.gray192
    }

}
