//
//  MapViewControllerViewModel.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 20/2/2564 BE.
//

import Foundation
import CoreLocation

class MapViewControllerViewModel {
    
    let locationManager = CLLocationManager()
    let authorizationStatus = CLLocationManager.authorizationStatus()
    let regionRadius: Double = 3000
    
    lazy var locationAccessEnable: Bool = {
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .authorizedAlways, .authorizedWhenInUse:
                return true
            default:
                return false
            }
        }
        return false
    }()
    
}
