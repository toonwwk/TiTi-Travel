//
//  RegisterViewController.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 17/2/2564 BE.
//

import UIKit

protocol registerViewControllerDelegate: AnyObject {
    func registerViewControllerDidTapNextButton(_ registerViewController: RegisterViewController)
}

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var userPicImageView: UIImageView!
    @IBOutlet weak var addImageButton: UIButton!
    @IBOutlet weak var nextButton: RoundButton!
    @IBOutlet weak var usernameContainerView: UIView!
    @IBOutlet weak var passwordContainerView: UIView!
    @IBOutlet weak var firstNameContianerView: UIView!
    @IBOutlet weak var lastNameContainerView: UIView!
    @IBOutlet weak var birthdayContainerView: UIView!
    
    
    var usernameTextfield: RegisterTextField!
    var passwordTextfield: RegisterTextField!
    var firstNameTextfield: RegisterTextField!
    var lastNameTextfield: RegisterTextField!
    var birthdayTextfield: RegisterTextField!

    weak var delegate: registerViewControllerDelegate?
    
    static func instantiate() -> RegisterViewController {
        return R.storyboard.registerViewController.instantiateInitialViewController()!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        configureNavigationBar()
    }
    
    private func commonInit() {
        addImageButton.setTitle("Add Profile Photo", for: .normal)
        addImageButton.setTitleColor(UIColor.app.green, for: .normal)
        addImageButton.titleLabel?.font = UIFont.app.semibold15
        backgroundView.backgroundColor = UIColor.app.white
        userPicImageView.image = R.image.iconUserImage()
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(UIColor.app.white, for: .normal)
        nextButton.backgroundColor = UIColor.app.green
        
        usernameTextfield = R.nib.registerTextField(owner: self)
        passwordTextfield = R.nib.registerTextField(owner: self)
        firstNameTextfield = R.nib.registerTextField(owner: self)
        lastNameTextfield = R.nib.registerTextField(owner: self)
        birthdayTextfield = R.nib.registerTextField(owner: self)
        
        usernameTextfield.configureView(with: .username)
        passwordTextfield.configureView(with: .password)
        firstNameTextfield.configureView(with: .firstName)
        lastNameTextfield.configureView(with: .lastName)
        birthdayTextfield.configureView(with: .birthDay)
        
        usernameContainerView.replace(by: usernameTextfield)
        passwordContainerView.replace(by: passwordTextfield)
        firstNameContianerView.replace(by: firstNameTextfield)
        lastNameContainerView.replace(by: lastNameTextfield)
        birthdayContainerView.replace(by: birthdayTextfield)
    }
    
    private func configureNavigationBar() {
        navigationItem.title = "Sign Up"
    }

    @IBAction func didTapNextButton(_ sender: Any) {
        delegate?.registerViewControllerDidTapNextButton(self)
    }
}
