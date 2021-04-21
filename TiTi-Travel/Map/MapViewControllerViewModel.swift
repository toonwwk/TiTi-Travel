//
//  MapViewControllerViewModel.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 20/2/2564 BE.
//

import Foundation

enum ServiceStatusType {
    case loading, success, failed
}

class MapViewControllerViewModel {
    
    let service = TiTiService()
    var touristSpots = [TouristSpot]()
    var statusType: ServiceStatusType = .loading
    var updateHandler: (() -> ())?

    func fetchTouristSpots(lat: Int, long: Int, priceRange: String, categories: [String]) {
        service.fetchData(lat: lat, long: long, priceRange: priceRange, categories: categories, isCompleted: { (data) in
            self.touristSpots = data.locations ?? []
            self.statusType = .success
            self.updateHandler?()
        }, isFailed: { (error) in
            print(error.localizedDescription)
            self.statusType = .failed
        })
    }
    
    func getNumberOfTouristSpots() -> Int { return statusType == .success ? touristSpots.count: 0 }
    
    func dataForPointAnnotation(at index: Int) -> CustomPointAnnotationViewModel {
        let touristSpot = touristSpots[index]
        let title = touristSpot.name ?? ""
        let des = touristSpot.description ?? ""
        let price = touristSpot.price ?? 0.0
        let images = touristSpot.images ?? [""]
        let priceRange = touristSpot.priceRange ?? "-"
        return CustomPointAnnotationViewModel(title: title, des: des, price: price, images: images, priceRange: priceRange)
        }
    
}
