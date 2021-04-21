//
//  Coordinator.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 22/2/2564 BE.
//

import UIKit

protocol Coordinator {
    
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
    func end()
    
}

class ApplicationCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
        
    let rootViewController = UIViewController()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.pushViewController(rootViewController, animated: false)
        self.navigationController.navigationBar.isTranslucent = false
        rootViewController.view.backgroundColor = UIColor.app.green
    }
    
    func start() {
        let child = UserAuthenticationCoordinator(navigationController: navigationController)
        child.delegate = self
        childCoordinators.append(child)
        child.start()
    }
    
    func start(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
        coordinator.start()
    }
    
    func end() {
        return
    }
    
}

extension ApplicationCoordinator: UserAuthenticationCoordinatorDelegate {
    
    func userAuthenticationCoordinatorDidFinish() {
        childCoordinators.last?.end()
        childCoordinators.removeLast()
        start(MapCoordinator(navigationController: navigationController))
    }
    
}
