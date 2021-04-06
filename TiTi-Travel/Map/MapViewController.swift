//
//  MapViewController.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 19/2/2564 BE.
//

import UIKit
import MapKit
import SWRevealViewController

class MapViewController: UIViewController, MKMapViewDelegate, SWRevealViewControllerDelegate {
    
    @IBOutlet weak var searchBarView: RoundViewWithEffect!
    @IBOutlet weak var searchImageView: UIImageView!
    @IBOutlet weak var searchLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var filterButton: RoundButton!
    @IBOutlet weak var relocateButton: RoundButton!
    
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
        return UIStoryboard(name: "MapViewController", bundle: nil).instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        commonInit()
        configureNavigationItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func commonInit() {
        searchImageView.image = UIImage.app.pin
        searchLabel.font = UIFont.app.regular15
        searchLabel.textColor = UIColor.app.gray192
        searchLabel.text = "search here"
        relocateButton.setImage(UIImage.app.centerLocation.withRenderingMode(.alwaysOriginal), for: .normal)
        relocateButton.backgroundColor = UIColor.app.green
        relocateButton.setTitle("", for: .normal)
        filterButton.backgroundColor = UIColor.app.white
        filterButton.setImage(UIImage.app.filter.withRenderingMode(.alwaysOriginal), for: .normal)
        filterButton.setTitle("filter", for: .normal)
        filterButton.titleLabel?.font = UIFont.app.regular12
        filterButton.setTitleColor(UIColor.app.green, for: .normal)
        filterButton.semanticContentAttribute = .forceRightToLeft
        mapView.showsCompass = false
        mapView.showsUserLocation = true
        mapView.delegate = self
        
        if(locationAccessEnable) {
            zoomToUserLocation()
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func configureNavigationItem() {
        if let rvv = self.revealViewController() {
            self.navigationItem.titleView = UIImageView(image: UIImage.app.navLogo)
            self.navigationController?.navigationBar.barTintColor = UIColor.app.green
            self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            rvv.rearViewRevealWidth = self.view.frame.width * 3 / 4
            self.navigationItem.leftBarButtonItem?.target = revealViewController()
            self.navigationItem.leftBarButtonItem?.action = #selector(SWRevealViewController.revealToggle(_:))
        }
    }
    
    func zoomToUserLocation() {
        guard let coordinate = locationManager.location?.coordinate else {return}
        let coordinateRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    @objc func didTapSideBarIcon() {
        
    }
    
    @IBAction func didTapFilterButton(_ sender: RoundButton) {
        
    }
    
    @IBAction func didTapRelocation(_ sender: RoundButton) {
        if(locationAccessEnable) {
            zoomToUserLocation()
        }
    }
    
}


extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print("location:: " + location.description)
            zoomToUserLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: " + error.localizedDescription)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if locationAccessEnable {
            locationManager.requestLocation()
            zoomToUserLocation()
        }
    }
    
}
