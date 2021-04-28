//
//  CustomPinViewModel.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 15/4/2564 BE.
//

import Foundation
import MapKit

class CustomPointAnnotationViewModel {
    
    let title: String
    let description: String
    let price: Double
    let priceRange: String
    let coordinate: CLLocationCoordinate2D
    var images: [String]
        
    init(title: String, des: String, price: Double, images: [String], priceRange: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.description = des
        self.price = price
        self.priceRange = priceRange
        self.coordinate = coordinate
        self.images = images
    }
    
}
