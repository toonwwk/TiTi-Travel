//
//  LoginViewController.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 14/2/2564 BE.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var iconAppImageView: UIImageView!
    @IBOutlet weak var iconUserImageView: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var iconPasswordImageView: UIImageView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgetPasswordButton: UIButton!
    @IBOutlet weak var registerLabel: UILabel!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    func configureView() {
        backgroundView.backgroundColor = AppAsset.green()
        iconAppImageView.image = AppAsset.iconApp()
        iconUserImageView.image = AppAsset.iconUsername()
        iconPasswordImageView.image = AppAsset.iconPassword()
        loginButton.backgroundColor = AppAsset.white()
        loginButton.setTitle("Sign In", for: .normal)
        loginButton.setTitleColor(AppAsset.green(), for: .normal)
        forgetPasswordButton.setTitle("Forget password?", for: .normal)
        forgetPasswordButton.setTitleColor(AppAsset.white(), for: .normal)
        forgetPasswordButton.titleLabel?.font = AppAsset.fontRegular13()
        usernameTextField.borderStyle = .none
        usernameTextField.tintColor = AppAsset.lightGray()
        usernameTextField.placeholder = "username"
        usernameTextField.font = AppAsset.fontRegular15()
        passwordTextField.borderStyle = .none
        passwordTextField.tintColor = AppAsset.lightGray()
        passwordTextField.placeholder = "password"
        passwordTextField.font = AppAsset.fontRegular15()
        registerLabel.text = "Do not have an account?"
        registerLabel.font = AppAsset.fontRegular15()
        registerButton.titleLabel?.font = AppAsset.fontRegular15()
        registerButton.setTitleColor(AppAsset.brown(), for: .normal)
        registerButton.titleLabel?.attributedText = NSAttributedString(string: "Sign Up", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        registerButton.setTitle(" Sign Up", for: .normal)
    }
    
    @IBAction func didPressLoginButton(_ sender: UIButton) {
    }
    
    @IBAction func didPressForgetPasswordButton(_ sender: UIButton) {
    }
    
    @IBAction func didPressRegisterButton(_ sender: UIButton) {
    }
}
