//
//  RegisterViewController.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 17/2/2564 BE.
//

import UIKit

protocol RegisterViewControllerDelegate: AnyObject {
    func registerViewControllerDidTapNextButton(_ registerViewController: RegisterViewController)
}

class RegisterViewController: UIViewController {
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var userPicImageView: RoundImageView!
    @IBOutlet weak var addImageButton: UIButton!
    @IBOutlet weak var nextButton: RoundButton!
    @IBOutlet weak var usernameContainerView: UIView!
    @IBOutlet weak var passwordContainerView: UIView!
    @IBOutlet weak var firstNameContianerView: UIView!
    @IBOutlet weak var lastNameContainerView: UIView!
    @IBOutlet weak var birthdayContainerView: UIView!
    
    let imagePicker = UIImagePickerController()
    
    var usernameTextfield: RegisterTextFieldController!
    var passwordTextfield: RegisterTextFieldController!
    var firstNameTextfield: RegisterTextFieldController!
    var lastNameTextfield: RegisterTextFieldController!
    var birthdayTextfield: RegisterTextFieldController!

    weak var delegate: RegisterViewControllerDelegate?
    
    static func instantiate() -> RegisterViewController {
        return UIStoryboard(name: "RegisterViewController", bundle: nil).instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
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
        addImageButton.setFontAndColor(with: UIFont.app.bold15, and: UIColor.app.green)
        backgroundView.backgroundColor = UIColor.app.white
        userPicImageView.image = UIImage.app.userImage
        nextButton.setTitle("Next", for: .normal)
        nextButton.setFontAndColor(with: UIFont.app.bold15, and: UIColor.app.white)
        nextButton.backgroundColor = UIColor.app.green
        
        
        
        usernameTextfield = Bundle(for: type(of: self)).loadNibNamed("RegisterTextFieldController", owner: self, options: nil)?.first as? RegisterTextFieldController
        passwordTextfield = Bundle(for: type(of: self)).loadNibNamed("RegisterTextFieldController", owner: self, options: nil)?.first as? RegisterTextFieldController
        firstNameTextfield = Bundle(for: type(of: self)).loadNibNamed("RegisterTextFieldController", owner: self, options: nil)?.first as? RegisterTextFieldController
        lastNameTextfield = Bundle(for: type(of: self)).loadNibNamed("RegisterTextFieldController", owner: self, options: nil)?.first as? RegisterTextFieldController
        birthdayTextfield = Bundle(for: type(of: self)).loadNibNamed("RegisterTextFieldController", owner: self, options: nil)?.first as? RegisterTextFieldController
        
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
        
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
    }
    
    private func configureNavigationBar() {
        navigationItem.title = "Sign Up"
    }

    @IBAction func didTapUploadImageButton(_ sender: UIButton) {
          present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func didTapNextButton(_ sender: RoundButton) {
        delegate?.registerViewControllerDidTapNextButton(self)
    }
}

extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            userPicImageView.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
}
