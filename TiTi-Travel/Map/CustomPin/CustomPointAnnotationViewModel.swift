//
//  CustomPinViewModel.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 15/4/2564 BE.
//

import Foundation

class CustomPointAnnotationViewModel {
    
    let title: String
    let description: String
    let price: String
    let images: [String]
    let priceRange: String
    
    init(title: String, des: String, price: Double, images: [String], priceRange: String) {
        self.title = title
        self.description = des
        self.price = String(format: "%.2f", price)
        self.images = images
        self.priceRange = priceRange
    }
    
}
