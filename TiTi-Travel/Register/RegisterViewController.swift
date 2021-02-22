//
//  RegisterViewController.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 17/2/2564 BE.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var userPicImageView: UIImageView!
    @IBOutlet weak var addImageButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var nextButton: RoundButton!
    
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
    
    func commonInit() {
        addImageButton.setTitle("Add Profile Photo", for: .normal)
        addImageButton.setTitleColor(UIColor.app.green, for: .normal)
        addImageButton.titleLabel?.font = UIFont.app.semibold15
        backgroundView.backgroundColor = UIColor.app.white
        userPicImageView.image = R.image.iconUserImage()
        nameLabel.textColor = UIColor.app.green
        nameLabel.font = UIFont.app.semibold15
        nameLabel.text = "Name"
        lastNameLabel.textColor = UIColor.app.green
        lastNameLabel.font = UIFont.app.semibold15
        lastNameLabel.text = "Last Name"
        ageLabel.textColor = UIColor.app.green
        ageLabel.font = UIFont.app.semibold15
        ageLabel.text = "Age"
        nameTextField.borderStyle = .none
        nameTextField.font = UIFont.app.regular15
        nameTextField.textColor = UIColor.app.green
        nameTextField.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.app.gray229])
        nameTextField.tintColor = UIColor.app.gray205
        lastNameTextField.borderStyle = .none
        lastNameTextField.font = UIFont.app.regular15
        lastNameTextField.textColor = UIColor.app.green
        lastNameTextField.attributedPlaceholder = NSAttributedString(string: "Last Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.app.gray229])
        lastNameTextField.tintColor = UIColor.app.gray205
        ageTextField.borderStyle = .none
        ageTextField.placeholder = "Age"
        ageTextField.font = UIFont.app.regular15
        ageTextField.textColor = UIColor.app.green
        ageTextField.attributedPlaceholder = NSAttributedString(string: "Age", attributes: [NSAttributedString.Key.foregroundColor: UIColor.app.gray229])
        ageTextField.tintColor = UIColor.app.gray205
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(UIColor.app.white, for: .normal)
        nextButton.backgroundColor = UIColor.app.green
    }
    
    func configureNavigationBar() {
        navigationItem.title = "Sign Up"
    }

    @IBAction func didTapNextButton(_ sender: Any) {
        let mapVC = MapViewController.instantiate()
        self.navigationController?.pushViewController(mapVC, animated: true)
    }
}
