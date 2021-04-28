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
    
    var centerCoordinate = CLLocationCoordinate2D()
    var titleLabels = [UILabel]()
    var anno = [CustomPointAnnotation]()

    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        configureNavigationItem()
        bindViewModel()
    }
    
    func commonInit() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
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
        locationAccessEnable ? zoomToUserLocation() : locationManager.requestWhenInUseAuthorization()
        if #available(iOS 13.0, *) {
            mapView.overrideUserInterfaceStyle = .light
        }
    }
    
    func configureNavigationItem() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = UIColor.app.white
        
        if let rvv = self.revealViewController() {
            self.navigationItem.titleView = UIImageView(image: UIImage.app.navLogo)
            self.navigationController?.navigationBar.barTintColor = UIColor.app.green
            self.navigationController?.navigationBar.isTranslucent = false
            self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.navigationItem.leftBarButtonItem?.target = rvv
            self.navigationItem.leftBarButtonItem?.action = #selector(SWRevealViewController.revealToggle(_:))
            filterButton.addTarget(rvv, action: #selector(rvv.rightRevealToggle(_:)), for: .touchUpInside)
            rvv.rearViewRevealWidth = self.view.frame.width * 3 / 4
            rvv.rightViewRevealWidth = self.view.frame.width * 3 / 4
            
            if let rightView = rvv.rightViewController as? FilterViewController {
                rightView.delegate = self
            }
        }
    }
    
    func bindViewModel() {
        viewModel.updateHandler = { [weak self] in
            guard let self = self else { return }
            self.addTouristSpots()
        }
    }
    
    func zoomToUserLocation() {
        guard let coordinate = locationManager.location?.coordinate else {return}
        let coordinateRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        centerCoordinate = coordinate
        mapView.setRegion(coordinateRegion, animated: true)
        viewModel.fetchTouristSpots(with: centerCoordinate, [], nil)
    }
    
    func addAnnotation(at location: Location) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        let pin = MKPointAnnotation()
        pin.title = location.title
        pin.coordinate = location.coordinate
        mapView.setRegion(coordinateRegion, animated: true)
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotations([pin])
        viewModel.fetchTouristSpots(with: centerCoordinate, [], nil)
    }
    
    func addTouristSpots() {
        for index in 0..<titleLabels.count {
            titleLabels[index].removeFromSuperview()
            mapView.removeAnnotation(anno[index])
        }
        mapView.addAnnotations(viewModel.getTouristSpotAnnotations())
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
        annotationView.canShowCallout = false
        
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
            anno.append(annotation as! CustomPointAnnotation)
            titleLabels.append(selectedLabel)
            return annotationView
        } else if annotation is MKPointAnnotation {
            return nil
        } else {
            return nil
        }
        
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let pin = view.annotation as? CustomPointAnnotation {
            let touristSpotDetailViewController = TouristSpotDetailViewController.instantiate()
            let vm = pin.viewModel
            let touristSpotDetailViewModel = TouristSpotDetailViewModel(title: vm.title, des: vm.description, price: vm.price, images: vm.images, priceRange: vm.priceRange)
            touristSpotDetailViewController.configure(with: touristSpotDetailViewModel)
            navigationController?.pushViewController(touristSpotDetailViewController, animated: true)
        } else {
            mapView.deselectAnnotation(view.annotation!, animated: false)
        }
    }
    
}


extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print("location:: " + location.description)
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
        centerCoordinate = location.coordinate
        addAnnotation(at: location)
    }
    
}

extension MapViewController: FilterViewControllerDelegate {
    
    func didTapConfirm(with categories: [String], and priceRange: String?) {
        viewModel.fetchTouristSpots(with: centerCoordinate, categories, priceRange)
    }
    
}
