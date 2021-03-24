//
//  PopupViewController.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 24/3/2564 BE.
//

import UIKit

class ErrorPopupViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    func commonInit() {
        closeButton.setTitle("close", for: .normal)
        closeButton.layer.borderWidth = 1
        closeButton.layer.cornerRadius = 20
        closeButton.layer.borderColor = UIColor.app.brown.cgColor
        closeButton.titleLabel?.font = UIFont.app.bold15
        closeButton.tintColor = UIColor.app.brown
        imageView.contentMode = .scaleAspectFit
        imageView.image = R.image.iconError()
        messageLabel.font = UIFont.app.bold15
        messageLabel.textColor = UIColor.app.brown
    }
    
    func configure(with errorMessage: String){
        messageLabel.text = errorMessage
    }
    
    @IBAction func didTapCloseButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
