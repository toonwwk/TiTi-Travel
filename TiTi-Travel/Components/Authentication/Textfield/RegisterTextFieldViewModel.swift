//
//  RegisterTextFieldViewModel.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 16/3/2564 BE.
//

import Foundation

class RegisterTextFieldViewModel {
  
    func validate(_ text: String, with type: RegisterTextFieldType) -> (result: Bool, errorMessage: String?) {
        let typeString = type.rawValue.titlecased().lowercased()
        
        if text.isEmpty {
            return (false, type.rawValue.titlecased().lowercased() + " can't be empty")
        }
        
        switch type {
        case .username, .password:
            if text.hasSpecialCharacter() {
                return (false, typeString + " can contain only alphabet, numeric, _ and -")
            } else if (text.count < 6 || text.count > 12) {
                return (false, typeString + " must be 6 to 12 characters")
            }
            return (true, nil)
        case .firstName, .lastName:
            if text.hasWhiteSpace() {
                return (false, typeString + "can''t contain space")
            } else if text.hasOnlyAlphabet(){
                return (false, "invalid " + typeString)
            }
            return (true, nil)
        default:
            return (true, nil)
        }
    }

}
