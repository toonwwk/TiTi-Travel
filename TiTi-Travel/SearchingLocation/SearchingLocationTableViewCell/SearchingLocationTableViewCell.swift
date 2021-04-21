//
//  TableViewCell.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 6/4/2564 BE.
//

import UIKit

class SearchingLocationTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    func commonInit() {
        titleLabel.setFontAndColor(with: UIFont.app.semibold15, and: UIColor.app.brown)
        addressLabel.setFontAndColor(with: UIFont.app.regular13, and: UIColor.app.brown)
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.app.gray192
        selectedBackgroundView = bgColorView
    }
    
    func configure(with title: String, and address: String) {
        titleLabel.text = title
        addressLabel.text = address
    }
    
}
