//
//  UserAuthCoordinator.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 22/2/2564 BE.
//

import UIKit

protocol UserAuthenticationCoordinatorDelegate: AnyObject {
    func userAuthenticationCoordinatorDidFinish()
}

class UserAuthenticationCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    weak var delegate: UserAuthenticationCoordinatorDelegate?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.barTintColor = UIColor.app.green
        UINavigationBar.appearance().titleTextAttributes = [.font: UIFont.app.bold18,
                                                            .foregroundColor: UIColor.app.white]
    }

    func start() {
        let loginViewController = LoginViewController.instantiate()
        loginViewController.delegate = self
        navigationController.pushViewController(loginViewController, animated: true)
    }
    
    func end() {
        navigationController.popToRootViewController(animated: true)
    }
    
}

// MARK:- LoginViewControllerDelegate
extension UserAuthenticationCoordinator: LoginViewControllerDelegate {
    
    func loginViewControllerDidTapRegisterButton(_ loginViewController: LoginViewController) {
        let registerViewController = RegisterViewController.instantiate()
        registerViewController.delegate = self        
        navigationController.pushViewController(registerViewController, animated: true)
    }
    
    func loginViewControllerDidTapLoginButton(_ loginViewController: LoginViewController) {
        delegate?.userAuthenticationCoordinatorDidFinish()
    }
    
}

// MARK:- RegisterViewControllerDelegate
extension UserAuthenticationCoordinator: RegisterViewControllerDelegate {
    
    func registerViewControllerDidTapNextButton(_ registerViewController: RegisterViewController) {
        navigationController.popViewController(animated: true)
    }

}
