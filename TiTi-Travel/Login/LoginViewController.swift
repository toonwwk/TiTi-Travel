//
//  LoginViewController.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 14/2/2564 BE.
//

import UIKit

protocol  LoginViewControllerDelegate: AnyObject {
    func loginViewControllerDidTapRegisterButton(_ loginViewController: LoginViewController)
    func loginViewControllerDidTapLoginButton(_ loginViewController: LoginViewController)
}

class LoginViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var iconAppImageView: UIImageView!
    @IBOutlet weak var iconUserImageView: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var iconPasswordImageView: UIImageView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgetPasswordButton: UIButton!
    @IBOutlet weak var registerLabel: UILabel!
    @IBOutlet weak var registerButton: RoundButton!

    weak var delegate: LoginViewControllerDelegate?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        configureNavigationBar()
    }

    static func instantiate() -> LoginViewController {
        return R.storyboard.loginViewController.instantiateInitialViewController()!
    }
    
    func commonInit() {
        backgroundView.backgroundColor = UIColor.app.green
        iconAppImageView.image = R.image.iconApp()
        iconUserImageView.image = R.image.iconUsername()
        iconPasswordImageView.image = R.image.iconPassword()
        loginButton.backgroundColor = UIColor.app.white
        loginButton.setTitle("Sign In", for: .normal)
        loginButton.setTitleColor(UIColor.app.green, for: .normal)
        forgetPasswordButton.setTitle("Forget password?", for: .normal)
        forgetPasswordButton.setTitleColor(UIColor.app.white, for: .normal)
        forgetPasswordButton.titleLabel?.font = UIFont.app.regular13
        usernameTextField.borderStyle = .none
        usernameTextField.tintColor = UIColor.app.gray205
        usernameTextField.textColor = UIColor.app.white
        usernameTextField.delegate = self
        usernameTextField.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.app.gray229])
        usernameTextField.font = UIFont.app.regular15
        passwordTextField.borderStyle = .none
        passwordTextField.tintColor = UIColor.app.gray205
        passwordTextField.textColor = UIColor.app.white
        passwordTextField.placeholder = "password"
        passwordTextField.font = UIFont.app.regular15
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.app.gray229])
        passwordTextField.delegate = self
        registerLabel.text = "Do not have an account?"
        registerLabel.font = UIFont.app.regular15
        registerLabel.textColor = UIColor.app.white
        registerButton.titleLabel?.font = UIFont.app.regular15
        registerButton.setTitleColor(UIColor.app.brown, for: .normal)
        registerButton.titleLabel?.attributedText = NSAttributedString(string: "Sign Up", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        registerButton.setTitle(" Sign Up", for: .normal)
    }
    
    func configureNavigationBar() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = UIColor.app.white
    }
    
    @IBAction func didTapLoginButton(_ sender: UIButton) {
        delegate?.loginViewControllerDidTapLoginButton(self)
    }
    
    @IBAction func didTapForgetPasswordButton(_ sender: UIButton) {
        return
    }
    
    @IBAction func didTapRegisterButton(_ sender: UIButton) {
        delegate?.loginViewControllerDidTapRegisterButton(self)
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
}
