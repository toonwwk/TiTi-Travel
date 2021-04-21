//
//  InputTextfield.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 11/3/2564 BE.
//

import UIKit

enum RegisterTextFieldType: String, CaseIterable {
    case username
    case password
    case firstName
    case lastName
    case birthDay
}

class RegisterTextFieldController: UIView {
        
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var textField: RegisterTextField!
    @IBOutlet weak var errorLabel: UILabel!

    var isValid = false

    private var textFieldType: RegisterTextFieldType!
    private var viewModel = RegisterTextFieldViewModel()

    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        commonInit()
    }
    
    func commonInit(){
        backgroundColor = UIColor.app.white
        leftLabel.textColor = UIColor.app.green
        leftLabel.font = UIFont.app.semibold15
        textField.delegate = self
        textField.returnKeyType = UIReturnKeyType.done
        errorLabel.textColor = UIColor.app.orange
        errorLabel.font = UIFont.app.regular10
        errorLabel.text = ""
    }
    
    func configureView(with type: RegisterTextFieldType) {
        self.tag = RegisterTextFieldType.allCases.firstIndex(of: type) ?? 99
        textFieldType = type
        leftLabel.text = type.rawValue.titlecased()
        textField.attributedPlaceholder = NSAttributedString(string: type.rawValue.titlecased(), attributes: [NSAttributedString.Key.foregroundColor: UIColor.app.gray229])
        
        if(type == .birthDay) {
            addDatePicker()
        }
        
    }
    
    func startEditing() {
        textField.becomeFirstResponder()
    }
    
    private func addDatePicker() {
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
extension RegisterTextFieldController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = self.superview?.superview?.viewWithTag(self.tag + 1) as? RegisterTextFieldController {
           nextField.startEditing()
        } else { 
           textField.resignFirstResponder()
        }
        return false
     }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let (result, errorMessage) = viewModel.validate(textField.text ?? "", with: textFieldType)
        isValid = result
        errorLabel.text = errorMessage
    }
    
}
