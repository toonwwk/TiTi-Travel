//
//  MapViewControllerViewModel.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 20/2/2564 BE.
//

import Foundation
import MapKit

enum ServiceStatusType {
    case loading, success, failed
}

class MapViewControllerViewModel {
    
    let service = TiTiService()
    var touristSpots = [TouristSpot]()
    var statusType: ServiceStatusType = .loading
    var updateHandler: (() -> ())?

    func fetchTouristSpots(with coordinate: CLLocationCoordinate2D, _ categories: [String], _ priceRange: String?) {
        let model = QueryModel(lat: coordinate.latitude, long: coordinate.longitude, categories: categories, priceRange: priceRange)
        
        service.fetchData(with: model, isCompleted: { (data) in
            self.touristSpots = data
            self.statusType = .success
            self.updateHandler?()
        }, isFailed: { (error) in
            print(error.localizedDescription)
            self.statusType = .failed
        })
    }
    
    func getNumberOfTouristSpots() -> Int { return statusType == .success ? touristSpots.count: 0 }
    
    func dataForPinAnnotation(at touristSpot: TouristSpot) -> CustomPointAnnotationViewModel {
        let title = touristSpot.name ?? ""
        let des = touristSpot.description ?? ""
        let price = touristSpot.estimatePrice ?? 0.0
        let images = touristSpot.image ?? [""]
        let priceRange = touristSpot.priceRange ?? "-"
        let lat = touristSpot.latitude ?? 0.0
        let long = touristSpot.longtitude ?? 0.0
        let coordinate = CLLocationCoordinate2DMake(lat, long)
        return CustomPointAnnotationViewModel(title: title, des: des, price: price, images: images, priceRange: priceRange, coordinate: coordinate)
    }
    
    func getTouristSpotAnnotations() -> [CustomPointAnnotation] {
        var touristSpotAnnotations = [CustomPointAnnotation]()

        for touristSpot in touristSpots {
            let viewModel = dataForPinAnnotation(at: touristSpot)
            let pin = CustomPointAnnotation(with: viewModel)
            pin.title = viewModel.title
            pin.coordinate = viewModel.coordinate
            touristSpotAnnotations.append(pin)
        }
        
        return touristSpotAnnotations
    }
    
}
