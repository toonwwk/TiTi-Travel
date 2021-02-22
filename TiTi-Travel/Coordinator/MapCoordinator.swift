//
//  MapCoordinator.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 22/2/2564 BE.
//

import UIKit

class MapCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    var mapViewController: MapViewController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        mapViewController = MapViewController.instantiate()
        navigationController.pushViewController(mapViewController, animated: true)
    }
    
    func end() {
        return
    }
    
}
