//
//  TouristSpot.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 9/4/2564 BE.
//

import Foundation

struct TouristSpot: Decodable {
    let name: String?
    let description: String?
    let price: Double?
    let lat: Double?
    let long: Double?
    let images: [String]?
    let priceRange: String?
}
