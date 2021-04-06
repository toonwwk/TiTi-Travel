//
//  MapCoordinator.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 22/2/2564 BE.
//

import UIKit
import SWRevealViewController

class MapCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.barTintColor = UIColor.app.green
        UINavigationBar.appearance().titleTextAttributes = [.font: UIFont.app.bold18,
                                                            .foregroundColor: UIColor.app.white]
        
    }
    
    func start() {
        let reveal =  UIStoryboard(name: "MapViewController", bundle: nil).instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
        navigationController.pushViewController(reveal, animated: true)
    }
    
    func end() {
        return
    }
    
}
