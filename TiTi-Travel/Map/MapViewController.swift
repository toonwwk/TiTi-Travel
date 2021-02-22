//
//  MapViewController.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 19/2/2564 BE.
//

import UIKit
import MapKit

class MapViewController: UIViewController,CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var searchBarView: RoundViewWithEffect!
    @IBOutlet weak var searchImageView: UIImageView!
    @IBOutlet weak var searchLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    let authorizationStatus = CLLocationManager.authorizationStatus()
    let regionRadius: Double = 2000
    
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
    
    static func instantiate() -> MapViewController {
        return R.storyboard.mapViewController.instantiateInitialViewController()!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        configureNavigationItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func commonInit() {
        searchImageView.image = R.image.iconPin()
        searchLabel.font = UIFont.app.regular15
        searchLabel.textColor = UIColor.app.gray192
        searchLabel.text = "search here"
        mapView.showsUserLocation = true
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        
        if(locationAccessEnable) {
            zoomToUserLocation()
        }
    }
    
    func configureNavigationItem() {
        let sideBarButton = UIBarButtonItem(image: R.image.iconSideBar(), style: UIBarButtonItem.Style.plain, target: self, action: #selector(didTapSideBarIcon))
        sideBarButton.tintColor = UIColor.app.white
        self.navigationItem.setLeftBarButton(sideBarButton, animated: true)
        self.navigationItem.titleView = UIImageView(image: R.image.iconNavBarLogo())
    }
    
    func zoomToUserLocation() {
        guard let coordinate = locationManager.location?.coordinate else {return}
        let coordinateRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if(locationAccessEnable) {
            zoomToUserLocation()
        }
    }
    
    @objc func didTapSideBarIcon() {
        
    }
    
}


