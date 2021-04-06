//
//  LoginViewController.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 14/2/2564 BE.
//

import UIKit
import EzPopup

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

    private var  screenSize = UIScreen.main.bounds
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
        return UIStoryboard(name: "LoginViewController", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
    }
    
    func commonInit() {
        loginButton.setTitle("Sign In", for: .normal)
        loginButton.backgroundColor = UIColor.app.white
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
        backgroundView.backgroundColor = UIColor.app.green
        iconAppImageView.image = UIImage.app.appLogo
        iconUserImageView.image = UIImage.app.username
        iconPasswordImageView.image = UIImage.app.password
    }
    
    func configureNavigationBar() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = UIColor.app.white
    }
    
    @IBAction func didTapLoginButton(_ sender: UIButton) {
//        let errorPopUpController = ErrorPopupViewController()
//        let popupVC = PopupViewController(contentController: errorPopUpController, popupWidth: screenSize.width - 60, popupHeight: 260)
//        popupVC.canTapOutsideToDismiss = true
//        popupVC.cornerRadius = 10
//        popupVC.shadowEnabled = true
//        errorPopUpController.transitioningDelegate = self
//        errorPopUpController.modalPresentationStyle = .formSheet
//        present(popupVC, animated: true, completion: nil)
//        errorPopUpController.configure(with: "Error I sus")
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
