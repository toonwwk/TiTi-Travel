//
//  InputTextfield.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 11/3/2564 BE.
//

import UIKit

class RegisterTextField: UIView {
    
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureView(with text: String) {
        leftLabel.textColor = UIColor.app.green
        leftLabel.font = UIFont.app.semibold15
        textField.borderStyle = .none
        textField.font = UIFont.app.regular15
        textField.textColor = UIColor.app.green
        textField.tintColor = UIColor.app.gray205
        errorLabel.textColor = UIColor.app.orange
        errorLabel.font = UIFont.app.regular10
        errorLabel.text = ""
        leftLabel.text = text
        textField.attributedPlaceholder = NSAttributedString(string: text.lowercased(), attributes: [NSAttributedString.Key.foregroundColor: UIColor.app.gray229])
    }
}
