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
        backgroundColor = UIColor.app.white
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
        textField.delegate = self
    }
    
    func addDatePicker() {
        self.textField.datePicker(target: self,
                                  doneAction: #selector(doneAction),
                                  cancelAction: #selector(cancelAction),
                                  datePickerMode: .date)
    }
    
    @objc
    private func cancelAction() {
        textField.resignFirstResponder()
    }
    
    @objc
    private func doneAction() {
        if let datePickerView = self.textField.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM-dd-yyyy"
            let dateString = dateFormatter.string(from: datePickerView.date)
            self.textField.text = dateString
            self.textField.resignFirstResponder()
        }
    }
    
}

// MARK:- UITextFieldDelegate
extension RegisterTextField: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        return false
    }
    
}
