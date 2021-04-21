//
//  MapViewController.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 19/2/2564 BE.
//

import UIKit
import MapKit
import SWRevealViewController

class MapViewController: UIViewController, SWRevealViewControllerDelegate {
    
    @IBOutlet weak var searchBarView: RoundViewWithEffect!
    @IBOutlet weak var searchImageView: UIImageView!
    @IBOutlet weak var searchLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var filterButton: RoundButton!
    @IBOutlet weak var relocateButton: RoundButton!
    
    let locationManager = CLLocationManager()
    let authorizationStatus = CLLocationManager.authorizationStatus()
    let regionRadius: Double = 2000
    let viewModel = MapViewControllerViewModel()
    
    var titleLabels = [UILabel]()
    
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
        
        if #available(iOS 13.0, *) {
            mapView.overrideUserInterfaceStyle = .light
        }
        
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
            self.navigationController?.navigationBar.isTranslucent = false
            self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.navigationItem.leftBarButtonItem?.target = rvv
            self.navigationItem.leftBarButtonItem?.action = #selector(SWRevealViewController.revealToggle(_:))
            rvv.rearViewRevealWidth = self.view.frame.width * 3 / 4
            rvv.rightViewRevealWidth = self.view.frame.width * 3 / 4
            if let c = rvv.rightViewController as? FilterViewController {
                c.delegate = self
            }
            filterButton.addTarget(rvv, action: #selector(SWRevealViewController.rightRevealToggle(_:)), for: .touchUpInside)
        }
        
    }
    
    func zoomToUserLocation() {
        guard let coordinate = locationManager.location?.coordinate else {return}
        let coordinateRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func addAnnotation(at location: Location) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        let pin = MKPointAnnotation()
        pin.title = location.title
        pin.coordinate = location.coordinate
        mapView.removeAnnotations(mapView.annotations)
        mapView.setRegion(coordinateRegion, animated: true)
        mapView.addAnnotations([pin])
    }
    
    func addCustomAnnotation(at location: Location) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
//        let pin = CustomPointAnnotation(with: viewModel.dataForPointAnnotation(at: 0))
        let pin = CustomPointAnnotation(with: CustomPointAnnotationViewModel(title: "t", des: "d", price: 0.0, images: [], priceRange: "d"))
        pin.title = location.title
        pin.coordinate = location.coordinate
        mapView.removeAnnotations(mapView.annotations)
        for label in titleLabels {
            label.removeFromSuperview()
        }
        mapView.setRegion(coordinateRegion, animated: true)
        mapView.addAnnotations([pin])
    }
    
    @IBAction func didTapFilterButton(_ sender: RoundButton) {
        
    }
    
    @IBAction func didTapRelocation(_ sender: RoundButton) {
        if(locationAccessEnable) {
            zoomToUserLocation()
        }
    }
    
    @IBAction func didTapSearchBar(_ sender: UITapGestureRecognizer) {
        let vc = SearchingLocationViewController.instantiate()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: false)
    }
    
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let Identifier = "Pin"
        let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: Identifier) ?? MKAnnotationView(annotation: annotation, reuseIdentifier: Identifier)

//        annotationView.canShowCallout = true
        if annotation is CustomPointAnnotation {
            let selectedLabel:UILabel = UILabel.init(frame: CGRect(x: 0, y: 0, width: 120, height: 25))
            selectedLabel.text = annotation.title ?? ""
            selectedLabel.textAlignment = .center
            selectedLabel.backgroundColor = UIColor.app.gray192.withAlphaComponent(0.5)
            selectedLabel.setFontAndColor(with: UIFont.app.semibold13, and: UIColor.app.brown)
            selectedLabel.layer.masksToBounds = true
            selectedLabel.translatesAutoresizingMaskIntoConstraints = false
            annotationView.contentMode = .scaleAspectFit
            annotationView.image =  UIImage.app.pin
            annotationView.addSubview(selectedLabel)
            selectedLabel.centerXAnchor.constraint(equalTo: annotationView.centerXAnchor).isActive = true
            selectedLabel.topAnchor.constraint(equalTo: annotationView.bottomAnchor).isActive = true
            titleLabels.append(selectedLabel)
            return annotationView
        } else if annotation is MKPointAnnotation {
            return nil
        } else {
            return nil
        }
        
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        let vc = TouristSpotDetailViewController.instantiate()
        navigationController?.pushViewController(vc, animated: true)
//        if let ann = view.annotation as? CustomPointAnnotation {
//            ann.printSth()
//        }
//
//
//
//        if let a = view.annotation?.title {
//            print("select :: " + (a ?? ""))
//            mapView.deselectAnnotation(view.annotation!, animated: false)
//        }
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

extension MapViewController: SearchingLocationViewControllerDelegate {
    
    func searchingLocationViewControllerDidSelect(_ location: Location) {
        addCustomAnnotation(at: location)
    }
    
}

extension MapViewController: FilterViewControllerDelegate {
    
    func didTapConfirm() {
    }
        
}
