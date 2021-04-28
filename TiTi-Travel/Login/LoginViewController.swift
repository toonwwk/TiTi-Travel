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
    @IBOutlet weak var usernameTextField: LoginTextField!
    @IBOutlet weak var iconPasswordImageView: UIImageView!
    @IBOutlet weak var passwordTextField: LoginTextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgetPasswordButton: UIButton!
    @IBOutlet weak var registerLabel: UILabel!
    @IBOutlet weak var registerButton: RoundButton!

    private let viewModel = LoginViewModel()
    
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
        loginButton.setFontAndColor(with: UIFont.app.bold15, and: UIColor.app.green)
        usernameTextField.setPlaceHolder(with: "username")
        usernameTextField.returnKeyType = UIReturnKeyType.done
        usernameTextField.delegate = self
        passwordTextField.setPlaceHolder(with: "password")
        passwordTextField.returnKeyType = UIReturnKeyType.done
        passwordTextField.delegate = self
        registerLabel.text = "Do not have an account?"
        registerLabel.setFontAndColor(with: UIFont.app.regular15, and: UIColor.app.white)
        registerButton.setFontAndColor(with: UIFont.app.regular15, and: UIColor.app.brown)
        registerButton.setUnderlinedText(with: " Sign up")
        backgroundView.backgroundColor = UIColor.app.green
        iconAppImageView.image = UIImage.app.appLogo
        iconUserImageView.image = UIImage.app.username
        iconPasswordImageView.image = UIImage.app.password

        //        forgetPasswordButton.setTitle("Forget password?", for: .normal)
        //        forgetPasswordButton.setTitleColor(UIColor.app.white, for: .normal)
        //        forgetPasswordButton.titleLabel?.font = UIFont.app.regular13
    }
    
    func configureNavigationBar() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = UIColor.app.white
    }
    
    @IBAction func didTapLoginButton(_ sender: UIButton) {
        if let errorMsg = viewModel.login(with: usernameTextField.text, and: passwordTextField.text) {
            let errorPopUpController = ErrorPopupViewController()
            let popupVC = PopupViewController(contentController: errorPopUpController, popupWidth: screenSize.width - 60, popupHeight: nil)
            popupVC.canTapOutsideToDismiss = true
            popupVC.cornerRadius = 10
            popupVC.shadowEnabled = true
            present(popupVC, animated: true, completion: nil)
            errorPopUpController.configure(with: errorMsg)
            return
        }

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
